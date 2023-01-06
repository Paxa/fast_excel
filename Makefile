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

all :
	# @echo "Compiling ext/text_width ..."
	# rake compile
	@echo "Compiling libxlsxwriter ..."
ifdef USE_CMAKE
	@echo "run cmake libxlsxwriter ..."
	cmake libxlsxwriter
else
	$(Q)$(MAKE) -C libxlsxwriter
endif

clean :
	$(Q)$(MAKE) clean -C libxlsxwriter

install :
	$(Q)cp libxlsxwriter/lib/$(LIBXLSXWRITER_SO) $(sitearchdir)
