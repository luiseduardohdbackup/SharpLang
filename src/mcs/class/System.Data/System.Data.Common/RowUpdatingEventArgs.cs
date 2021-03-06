//
// System.Data.Common.RowUpdatingEventArgs.cs
//
// Author:
//   Rodrigo Moya (rodrigo@ximian.com)
//   Tim Coleman (tim@timcoleman.com)
//
// (C) Ximian, Inc
// Copyright (C) Tim Coleman, 2002
//

//
// Copyright (C) 2004 Novell, Inc (http://www.novell.com)
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
// 
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

namespace System.Data.Common {
	public
#if !NET_2_0
	abstract
#endif
	class RowUpdatingEventArgs : EventArgs
	{
		#region Fields

		DataRow dataRow;
		IDbCommand command;
		StatementType statementType;
		DataTableMapping tableMapping;
		UpdateStatus status;
		Exception errors;
		

		#endregion // Fields

		#region Constructors

#if NET_2_0
		public
#else
		protected
#endif
		RowUpdatingEventArgs (DataRow dataRow, IDbCommand command, StatementType statementType, DataTableMapping tableMapping) 
		{
			this.dataRow = dataRow;
			this.command = command;
			this.statementType = statementType;
			this.tableMapping = tableMapping;
			this.status = UpdateStatus.Continue;
			this.errors = null;
		}

		#endregion // Constructors

		#region Properties
		
		public IDbCommand Command {
			get { return command; }
			set { command = value; }
		}

		public Exception Errors {
			get { return errors; }
			set { errors = value; }
		}

		public DataRow Row {
			get { return dataRow; }
		}

		public StatementType StatementType {
			get { return statementType; }
		}

		public UpdateStatus Status {
			get { return status; }
			set { status = value; }
		}

		public DataTableMapping TableMapping {
			get { return tableMapping; }
		}

		#if NET_2_0
		
		protected virtual IDbCommand BaseCommand {
			get { return this.command; }	
			set { this.command = value; }
		}

		#endif

		#endregion // Properties
	}
}
