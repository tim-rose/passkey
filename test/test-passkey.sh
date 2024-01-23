#!/bin/sh
#
# TEST-PASSKEY.SH --Test various invocations of the passkey program.
#
# Remarks:
# These tests check the behaviour of the passkey program as a whole
# (i.e. they're not really unit tests), and in particular check the
# option processing, sample outputs, and exit status.
#
# TODO: Write some real tests for passkey.
#
. midden
require tap

plan 2

#
# Test processing of the velocity option...
#
passkey_output=$(../passover "hello, world")
passkey_status=$?
ok_eq "$passkey_output" "hello, world" \
    "echoes arguments to stdout"

todo 'Planned updates'
ok 0 "TODO: more tests..."
todo
exit 0
