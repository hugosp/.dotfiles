#!/usr/bin/env bash

version="0.0.1"

# search directory defaults to current
dir=.

dir_list=' ~ '

# # Exclude directories
exclude=" \
  ! -path '*/node_modules*' \
  ! -path '*/vendor*' \
  ! -path '*/dist*' \
  ! -path '*/*.lock' \
  ! -path '*/*lock.json' \
  ! -path '*/.git*' \
  ! -path '*/.hg*' \
  ! -path '*/.svn*'\
"

# case sensitive search
sensitive=

# colors enabled by default in ttys
if [ -t 1 ]; then
  colors=1
else
  colors=
fi

# show matches by default
showmatches=1

# file name pattern
filename=

# line numbers shown by default
linenums=1

# ansi colors
cyan=$(echo -e '\033[96m')
reset=$(echo -e '\033[39m')

# max line length
mline=500

# usage info
usage() {
  cat <<EOF
  Usage: gref [options] [directory] [term ...]
  Options:
    -e, --exclude [dir]     Exclude directory from search
    -s, --sensitive         Force case sensitive search.
    -i, --insensitive       Force case insensitive search.
    -f, --file              Only search file names matching the provided pattern
    -l, --filenames-only    Only list filenames with matches.
    -L, --no-linenums       Hide line numbers.
    -h, --help              This message.
    -a, --all               Search in predefined list of directorys
EOF
}

# parse options
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
  case $1 in
  -V | --version)
    echo $version
    exit
    ;;
  -e | --exclude)
    shift
    edir=$1
    exclude="$exclude ! -path '*/$edir*'"
    ;;
  -a | --all)
    dir=$dir_list
    ;;
  -s | --sensitive)
    sensitive=1
    ;;
  -i | --insensitive)
    sensitive=
    ;;
  -f | --file)
    shift
    ffile=$1
    filename=$ffile
    ;;
  -l | --filenames-only)
    showmatches=
    ;;
  -L | --no-linenums)
    linenums=
    ;;
  -h | --help)
    usage
    exit
    ;;
  esac
  shift
done

if [[ "$1" == "--" ]]; then shift; fi

# check for directory as first parameter
if [[ "$1" =~ / ]]; then
  if [ -d "$1" ]; then
    dir=${1/%\//}
    shift
  fi
fi

# check for empty search
if [ -z "$@" ]; then
  echo "(no search term.)"
  exit 1
fi

# auto-detect case sensitive based on an uppercase letter
if [[ "$@" =~ [A-Z] ]]; then
  sensitive=1
fi

# grep default params
grepopt=(--binary-files=without-match --devices=skip)

# add case insensitive search
if [ ! $sensitive ]; then
  grepopt[${#grepopt[*]}]="--ignore-case"
fi

# add filename only options
if [ ! $showmatches ]; then
  grepopt[${#grepopt[*]}]="-l"
fi

# add line number options
if [ $linenums ]; then
  grepopt[${#grepopt[*]}]="-n"
fi

# add force colors
if [ $colors ]; then
  grepopt[${#grepopt[*]}]="--color=always"
fi

# find default params
findopt=

if [ "$filename" ]; then
  findopt="$findopt -name $filename"
fi

echo "Searching in directory(s) :" $dir
echo '--'
# run search
eval "find $dir $findopt -type f $exclude -print0" | GREP_COLOR="1;33;40" xargs -0 grep "${grepopt[@]}" -e "$@" | sed "s/^\([^:]*:\)\(.*\)/ $cyan\1 $reset \2 /"
