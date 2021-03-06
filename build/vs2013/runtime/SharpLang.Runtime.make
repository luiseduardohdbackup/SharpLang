# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug_x32
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug_x32)
  CC = clang
  CXX = clang++
  AR = ar
  LLVM_LINK = llvm-link
  TARGETDIR = ../lib/debug_x32
  TARGET = $(TARGETDIR)/SharpLang.Runtime.bc
  OBJDIR = obj/x32/debug
  DEFINES += -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DLIBCXXABI_HAS_NO_THREADS
  INCLUDES += -I../../../deps/llvm/include -I../../../deps/llvm/build_x32/include -I../../../deps/mingw32/i686-w64-mingw32/include -I../../../deps/mingw32/i686-w64-mingw32/include/c++ -I../../../deps/mingw32/i686-w64-mingw32/include/c++/i686-w64-mingw32
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -emit-llvm -O3 -g1 --target=i686-w64-mingw32
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -shared -Wl,--out-implib="../lib/debug_x32/SharpLang.Runtime.lib" -m32
  LINKCMD = $(LLVM_LINK) -o $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug_x64)
  CC = clang
  CXX = clang++
  AR = ar
  LLVM_LINK = llvm-link
  TARGETDIR = ../lib/debug_x64
  TARGET = $(TARGETDIR)/SharpLang.Runtime.bc
  OBJDIR = obj/x64/debug
  DEFINES += -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DLIBCXXABI_HAS_NO_THREADS
  INCLUDES += -I../../../deps/llvm/include -I../../../deps/llvm/build_x64/include -I../../../deps/mingw64/x86_64-w64-mingw32/include -I../../../deps/mingw64/x86_64-w64-mingw32/include/c++ -I../../../deps/mingw64/x86_64-w64-mingw32/include/c++/x86_64-w64-mingw32
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -emit-llvm -O3 -g1 --target=x86_64-w64-mingw32
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -shared -Wl,--out-implib="../lib/debug_x64/SharpLang.Runtime.lib" -m64
  LINKCMD = $(LLVM_LINK) -o $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x32)
  CC = clang
  CXX = clang++
  AR = ar
  LLVM_LINK = llvm-link
  TARGETDIR = ../lib/release_x32
  TARGET = $(TARGETDIR)/SharpLang.Runtime.bc
  OBJDIR = obj/x32/release
  DEFINES += -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DLIBCXXABI_HAS_NO_THREADS
  INCLUDES += -I../../../deps/llvm/include -I../../../deps/llvm/build_x32/include -I../../../deps/mingw32/i686-w64-mingw32/include -I../../../deps/mingw32/i686-w64-mingw32/include/c++ -I../../../deps/mingw32/i686-w64-mingw32/include/c++/i686-w64-mingw32
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -emit-llvm -O3 -g1 --target=i686-w64-mingw32
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -shared -Wl,--out-implib="../lib/release_x32/SharpLang.Runtime.lib" -m32
  LINKCMD = $(LLVM_LINK) -o $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x64)
  CC = clang
  CXX = clang++
  AR = ar
  LLVM_LINK = llvm-link
  TARGETDIR = ../lib/release_x64
  TARGET = $(TARGETDIR)/SharpLang.Runtime.bc
  OBJDIR = obj/x64/release
  DEFINES += -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DLIBCXXABI_HAS_NO_THREADS
  INCLUDES += -I../../../deps/llvm/include -I../../../deps/llvm/build_x64/include -I../../../deps/mingw64/x86_64-w64-mingw32/include -I../../../deps/mingw64/x86_64-w64-mingw32/include/c++ -I../../../deps/mingw64/x86_64-w64-mingw32/include/c++/x86_64-w64-mingw32
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -emit-llvm -O3 -g1 --target=x86_64-w64-mingw32
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -shared -Wl,--out-implib="../lib/release_x64/SharpLang.Runtime.lib" -m64
  LINKCMD = $(LLVM_LINK) -o $(TARGET) $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/mulodi4.o \
	$(OBJDIR)/abort_message.o \
	$(OBJDIR)/cxa_guard.o \
	$(OBJDIR)/ConvertUTF.o \
	$(OBJDIR)/Exception.o \
	$(OBJDIR)/Internal.o \
	$(OBJDIR)/Marshal.o \
	$(OBJDIR)/MonoIO.o \
	$(OBJDIR)/PInvoke.o \
	$(OBJDIR)/RuntimeType.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES) ${CUSTOMFILES}
	@echo Linking SharpLang.Runtime
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning SharpLang.Runtime
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/mulodi4.o: ../../../deps/compiler-rt/lib/builtins/mulodi4.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE)  -fno-exceptions -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/abort_message.o: ../../../deps/libcxxabi/src/abort_message.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE)  -std=c++11 -fno-exceptions -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/cxa_guard.o: ../../../deps/libcxxabi/src/cxa_guard.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE)  -std=c++11 -fno-exceptions -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/ConvertUTF.o: ../../../src/SharpLang.Runtime/ConvertUTF.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE)  -fno-exceptions -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Exception.o: ../../../src/SharpLang.Runtime/Exception.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE)  -std=c++11 -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Internal.o: ../../../src/SharpLang.Runtime/Internal.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE)  -std=c++11 -fno-exceptions -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/Marshal.o: ../../../src/SharpLang.Runtime/Marshal.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE)  -std=c++11 -fno-exceptions -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/MonoIO.o: ../../../src/SharpLang.Runtime/MonoIO.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE)  -std=c++11 -fno-exceptions -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/PInvoke.o: ../../../src/SharpLang.Runtime/PInvoke.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE)  -std=c++11 -fno-exceptions -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/RuntimeType.o: ../../../src/SharpLang.Runtime/RuntimeType.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE)  -std=c++11 -fno-exceptions -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
