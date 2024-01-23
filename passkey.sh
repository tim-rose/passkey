#!/bin/bash
#
# PASSKEY --Print some words at random from a dictionary.
#
# Remarks:
# This program prints words for use as a pass phrase.
# It is inspired by an XKCD.
#
# See Also:
# https://xkcd.com/936
#
. midden
require "log"
require "getopt"

VERSION=

dictionary=             # set by getopts
n_words=                # set by getopts
opts="d.dictionary=/usr/local/share/text/words-3000.txt;n.n_words=4;V.version;?.help"
opts="$opts;$LOG_GETOPTS"	# add standard logging options

#
# main() --Process cmd-line options and print some words.
#
main()
{
    if ! eval $(getopt_long_args -d "$opts" "$@"); then
	usage "$opts" >&2
	exit 2
    fi
    log_getopts

    if [ "$help" ]; then
	usage "$opts" >&2
	exit 0
    fi
    if [ "$version" ]; then
	printf '%s version %s\n' "${0##*/}" "$VERSION"
	exit 0
    fi
    
    local n=$(wc -l < $dictionary)
    info 'dictionary: "%s": %d words' "$dictionary" "$n"

    for i in $(seq $n_words); do
        local w=$(( ($RANDOM*32768 + $RANDOM) % n ))
        local word=$(sed -ne "${w}p" "$dictionary")
        printf '%s ' "$word"
    done
    printf '\n'
}

#
# usage() --Echo passkey's help/usage message.
#
usage()
{
    cat <<- EOT
	Print some randomly selected words.

EOT
    getopt_usage "passover [options]" "$1"
}

main "$@"
