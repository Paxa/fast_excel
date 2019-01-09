Q=@
ifdef V
Q=
endif

all :
	@echo "Compiling ext/text_width ..."
	rake compile
	@echo "Compiling libxlsxwriter ..."
	$(Q)$(MAKE) -C libxlsxwriter

clean :
	$(Q)$(MAKE) clean -C libxlsxwriter

install :
	@echo "Nothing to install"