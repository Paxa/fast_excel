Q=@
ifdef V
Q=
endif

UNAME := $(shell uname)

LIBXLSXWRITER_SO = libxlsxwriter.so

ifeq ($(UNAME), Darwin)
LIBXLSXWRITER_SO = libxlsxwriter.dylib
endif

# Check for MinGW/MinGW64/Cygwin environments.
ifneq (,$(findstring MINGW, $(UNAME)))
MING_LIKE = y
endif
ifneq (,$(findstring MSYS, $(UNAME)))
MING_LIKE = y
endif
ifneq (,$(findstring CYGWIN, $(UNAME)))
MING_LIKE = y
endif

ifdef MING_LIKE
LIBXLSXWRITER_SO = libxlsxwriter.dll
endif

# with xcode better to use cmake
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),"Darwin")
	USE_CMAKE := $(shell command -v cmake 2> /dev/null)
endif

ifndef ($(sitearchdir))
	sitearchdir = './lib'
endif

# Custom extensions
CUSTOM_EXT_DIR = ext/fast_excel_ext
CUSTOM_OBJS = $(CUSTOM_EXT_DIR)/custom_workbook.o
CUSTOM_LIB_STATIC = $(CUSTOM_EXT_DIR)/libfast_excel_ext.a

ifeq ($(UNAME), Darwin)
CUSTOM_LIB = $(CUSTOM_EXT_DIR)/libfast_excel_ext.dylib
LDFLAGS = -dynamiclib ./libxlsxwriter/lib/libxlsxwriter.a
else ifdef MING_LIKE
CUSTOM_LIB = $(CUSTOM_EXT_DIR)/libfast_excel_ext.dll
LDFLAGS = -shared ./libxlsxwriter/lib/libxlsxwriter.a
else
CUSTOM_LIB = $(CUSTOM_EXT_DIR)/libfast_excel_ext.so
LDFLAGS = -shared ./libxlsxwriter/lib/libxlsxwriter.a
endif

CFLAGS = -I./libxlsxwriter/include -fPIC -O2

all : libxlsxwriter custom_ext

.PHONY: libxlsxwriter

libxlsxwriter :
	@echo "Compiling libxlsxwriter ..."
ifdef USE_CMAKE
	@echo "run cmake libxlsxwriter ..."
	cmake libxlsxwriter
else
	$(Q)LDFLAGS= $(MAKE) -C libxlsxwriter
endif

custom_ext : $(CUSTOM_LIB)
	@echo "Custom extensions built successfully"

$(CUSTOM_EXT_DIR)/%.o : $(CUSTOM_EXT_DIR)/%.c
	@echo "Compiling $< ..."
	$(Q)$(CC) $(CFLAGS) -c $< -o $@

$(CUSTOM_LIB) : $(CUSTOM_OBJS) ./libxlsxwriter/lib/libxlsxwriter.a
	@echo "Creating custom extensions shared library ..."
	$(Q)$(CC) $(LDFLAGS) -o $@ $(CUSTOM_OBJS)

clean :
	$(Q)$(MAKE) clean -C libxlsxwriter
	$(Q)rm -f $(CUSTOM_OBJS) $(CUSTOM_LIB) $(CUSTOM_LIB_STATIC)

install :
	$(Q)cp libxlsxwriter/lib/$(LIBXLSXWRITER_SO) $(sitearchdir)
	$(Q)cp $(CUSTOM_LIB) $(sitearchdir)
