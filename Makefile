#
# Makefile --Build rules for SKEL, the passkey file processor.
#
language = sh nroff

SH_SRC = passkey.sh
MAN1_SRC = passkey.1

include makeshift.mk 

install: install-all
uninstall: uninstall-all
