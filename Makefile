Q=@
ifdef V
Q=
endif

# with xcode better to use cmake
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),"Darwin")
	USE_CMAKE := $(shell command -v cmake 2> /dev/null)
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
	@echo "Nothing to install"