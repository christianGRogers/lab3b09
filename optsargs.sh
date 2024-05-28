#!/bin/sh
vi=0
N='nobody'
M=""
while getopts "hm:N:v" o; do
    case "${o}" in
        h)
            cat << EOF
Options:
-h       Print this help message.
-m MSG   Add message.
-N NAME  Set name.
-v       Add Verbosity.
EOF
            exit 0
            ;;
        m)
            M=${M}${OPTARG}
            ;;
        v)
            vi=$((vi + 1))
            ;;
        N)
            N=${OPTARG}
        ;;
	?)
	   exit 1
	;;
    esac
done
echo "v=${vi}";
echo "N='${N}'";
shift $(expr $OPTIND - 1)
for f in "$@"; do
        echo ${f}:${M};
done
