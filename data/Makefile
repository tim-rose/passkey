#
# Makefile --rules for installing passkey's input data.
#
subdir = text
DATA_SRC = words-3000.txt

include makeshift.mk

install: $(DATA_SRC:%=$(datadir)/%)

uninstall: uninstall-data
uninstall-data:
	$(RM) $(DATA_SRC:%=$(datadir)/%)
	$(RMDIR) $(datadir)
