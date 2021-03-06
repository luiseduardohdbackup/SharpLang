// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

using System.Diagnostics;
using System.IO;
using System.Reflection.Metadata;
using System.Runtime.ExceptionServices;
using System.Runtime.InteropServices;

namespace System.Reflection.Internal
{
    internal static class FileStreamReadLightUp
    {
        internal static Lazy<Type> FileStreamType = new Lazy<Type>(() =>
        {
            try
            {
                return Type.GetType("System.IO.FileStream, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089", throwOnError: false);
            }
            catch
            {
                // Note that there are cases where Type.GetType throws even when throwOnError is false. 
                // TODO- check which cases exactly and catch specific exception(s). 
                return null;
            }
        });

        internal static Lazy<PropertyInfo> SafeFileHandle = new Lazy<PropertyInfo>(() =>
        {
            return FileStreamType.Value.GetTypeInfo().GetDeclaredProperty("SafeFileHandle");
        });

        // internal for testing
        internal static bool readFileCompatNotAvailable;
        internal static bool readFileModernNotAvailable;
        internal static bool safeFileHandleNotAvailable;

        internal static bool IsFileStream(Stream stream)
        {
            if (FileStreamType.Value == null)
            {
                return false;
            }

            var type = stream.GetType();
            return type == FileStreamType.Value || type.GetTypeInfo().IsSubclassOf(FileStreamType.Value);
        }

        internal static SafeHandle GetSafeFileHandle(Stream stream)
        {
            DebugCorlib.Assert(FileStreamType.IsValueCreated && FileStreamType.Value != null && IsFileStream(stream));

            if (safeFileHandleNotAvailable)
            {
                return null;
            }

            PropertyInfo safeFileHandleProperty = SafeFileHandle.Value;
            if (safeFileHandleProperty == null)
            {
                safeFileHandleNotAvailable = true;
                return null;
            }

            SafeHandle handle;
            try
            {
                handle = (SafeHandle)safeFileHandleProperty.GetValue(stream);
            }
            catch (MemberAccessException)
            {
                safeFileHandleNotAvailable = true;
                return null;
            }
            catch (TargetInvocationException)
            {
                // Some FileStream implementations (e.g. IsolatedStorage) restrict access to the underlying handle by throwing 
                // Tolerate it and fall back to slow path.
                return null;
            }

            if (handle != null && handle.IsInvalid)
            {
                // Also allow for FileStream implementations that do return a non-null, but invalid underlying OS handle.
                // This is how brokered files on WinRT will work. Fall back to slow path.
                return null;
            }

            return handle;
        }

        internal static unsafe bool TryReadFile(Stream stream, byte* buffer, long start, int size)
        {
            if (readFileModernNotAvailable && readFileCompatNotAvailable)
            {
                return false;
            }

            SafeHandle handle = GetSafeFileHandle(stream);
            if (handle == null)
            {
                return false;
            }

            bool result = false;
            int bytesRead = 0;

            if (!readFileModernNotAvailable)
            {
                try
                {
                    result = NativeMethods.ReadFileModern(handle, buffer, size, out bytesRead, IntPtr.Zero);
                }
                catch
                {
                    readFileModernNotAvailable = true;
                }
            }

            if (readFileModernNotAvailable)
            {
                try
                {
                    result = NativeMethods.ReadFileCompat(handle, buffer, size, out bytesRead, IntPtr.Zero);
                }
                catch
                {
                    readFileCompatNotAvailable = true;
                    return false;
                }
            }

            if (!result || bytesRead != size)
            {
                throw new IOException(MetadataResources.UnableToReadMetadataFile, Marshal.GetLastWin32Error());
            }

            return true;
        }

        private static unsafe class NativeMethods
        {
            // API sets available on modern platforms:
            [DllImport(@"api-ms-win-core-file-l1-2-0.dll", EntryPoint = "ReadFile", ExactSpelling = true, SetLastError = true)]
            [return: MarshalAs(UnmanagedType.Bool)]
            internal static extern bool ReadFileModern(
                 SafeHandle fileHandle,
                 byte* buffer,
                 int byteCount,
                 out int bytesRead,
                 IntPtr overlapped
            );

            // older Windows systems:
            [DllImport(@"kernel32.dll", EntryPoint = "ReadFile", ExactSpelling = true, SetLastError = true)]
            [return: MarshalAs(UnmanagedType.Bool)]
            internal static extern bool ReadFileCompat(
                 SafeHandle fileHandle,
                 byte* buffer,
                 int byteCount,
                 out int bytesRead,
                 IntPtr overlapped
            );
        }
    }
}
