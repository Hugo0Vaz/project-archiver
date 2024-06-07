#!/bin/env bash
#
#
#                     _           _                       _     _
#     _ __  _ __ ___ (_) ___  ___| |_       __ _ _ __ ___| |__ (_)_   _____ _ __
#    | '_ \| '__/ _ \| |/ _ \/ __| __|____ / _` | '__/ __| '_ \| \ \ / / _ \ '__|
#    | |_) | | | (_) | |  __/ (__| ||_____| (_| | | | (__| | | | |\ V /  __/ |
#    | .__/|_|  \___// |\___|\___|\__|     \__,_|_|  \___|_| |_|_| \_/ \___|_|
#    |_|           |__/
#
#    Author: Hugo Martins Vaz Silva (Hugo0vaz)
#    E-mail: hugomartinsvaz@gmail.com
#
#

VERBOSE=false
FZF=false

SUBCOMMAND="$1"
ARG1="$2"
ARG2="$3"

usage() {
  echo "Usage: $0 (archive|unarchive) (project) (archive_dir|projects_dir) [-hvf]"
  echo ""
  echo "Commands:"
  echo "  archive         Archives the project in the archive dir"
  echo "  unarchive       Unarchives the project to the projects dir"
  echo ""
  echo "Options:"
  echo "  -h, --help      Display help image"
  echo "  -v, --verbose   Enable verbose mode"
  echo "  -f, --fzf       Use FZF as the project chooser for archive or unarchive"
}

verbose_echo() {
  if [ "$verbose_mode" = true ] ; then
      echo "$1"
  fi
}

handle_options() {
  while [[ "$1" == --* ]]; do
    case "$1" in
      --help)
        usage
        ;;
      --verbose)
        VERBOSE=true
        ;;
      --fzf)
        FZF=true
        ;;
      *)
        echo "Unknown option: $1"
        usage
        ;;
    esac
    shift
  done
}

archive() {
  echo "archiving..."
}

unarchive() {
  echo "unarchiving..."
}

case "$SUBCOMMAND" in
  archive)
    handle_options "$@"
    archive
    ;;

  unarchive)
    handle_options "$@"
    unarchive
    ;;

  *)
    usage
    ;;
esac






