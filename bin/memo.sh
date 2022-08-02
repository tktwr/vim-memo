#!/bin/bash

cols=80

which tput > /dev/null 2>&1
if [ $? -eq 0 ]; then
  cols=$(tput cols)
fi

bin_name=`basename $0`
tags_files=""

f_help() {
  echo "NAME"
  echo "  $bin_name"
  echo
  echo "SYNOPSIS"
  echo "  $bin_name [options] [tag]"
  echo
  echo "OPTIONS"
  echo "  -h, --help   ... print help"
  echo "  -p           ... print tags"
  echo "  --fzy        ... print tags for fzy"
  echo "  -s=tag       ... search tag"
  echo "  -t=tags_file ... add tags file"
  echo "  -c=N         ... set N columns"
  echo
  echo "TAGS"
  f_print_tags
}

f_print_tags() {
  for i in $tags_files; do
    if [ -f $i ]; then
      echo "[$i]"
      awk '{print $1}' $i | grep '^memo_' | sed 's/memo_//' | column -c $cols
      echo
    fi
  done
}

f_fzy_tags() {
  for i in $tags_files; do
    if [ -f $i ]; then
      awk '{print $1}' $i | grep '^memo_'
    fi
  done
}

f_search_tag() {
  for i in $tags_files; do
    if [ -f $i ]; then
      awk '{print $1}' $i | grep '^memo_' | grep $1
    fi
  done
}

f_exec_vim() {
  vim -t "$1" -c "normal zt"
}

f_main() {
  if [ $# -eq 0 ]; then
    vim -c "Memo" -c "only"
    exit
  fi
  for i in $*; do
    case $i in
      -h|--help)
        f_help
        exit
        ;;
      -p)
        f_print_tags
        exit
        ;;
      --fzy)
        f_fzy_tags
        exit
        ;;
      -s=*)
        tag=`echo $i | sed 's+^-s=++'`
        f_search_tag $tag
        exit
        ;;
      -t=*)
        tag=`echo $i | sed 's+^-t=++'`
        tags_files="$tags_files $tag"
        ;;
      -c=*)
        cols=`echo $i | sed 's+^-c=++'`
        ;;
      *)
        f_exec_vim `f_search_tag $i`
        ;;
    esac
  done
}

f_main "$@"

