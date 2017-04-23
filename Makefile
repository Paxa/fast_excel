Q=@
ifdef V
Q=
endif

all :
	@echo "Compiling libxlsxwriter ..."
	$(Q)$(MAKE) -C libxlsxwriter

clean :
	$(Q)$(MAKE) clean -C libxlsxwriter

install :
	@echo "Nothing to install"