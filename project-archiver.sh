#!/bin/env bash
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
  echo "Usage: $0 (archive|unarchive) (project) (archive_dir|projects_dir)"
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

check_arguments() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Not enough arguments provided"
        exit 1
    fi

    if [ ! -d "$1" ]; then
        echo "The first argument is not a folder or does not exist."
        exit 1
    fi

    if [ ! -d "$2" ]; then
        echo "The second argument is not a folder or does not exist."
        exit 1
    fi

    realpath1=$(realpath "$1")
    realpath2=$(realpath "$2")

    if [ $? -ne 0 ]; then
        echo "Error resolving realpath for one or both paths."
        exit 1
    fi

    if [ "$realpath1" = "$realpath2" ]; then
        echo "Both paths refer to the same folder."
        exit 1
    fi
}

archive() {
  echo "archiving: $1 to $2"
  mv $1 $2
  sleep 1
}

unarchive() {
  echo "unarchiving: $1 to $2"
  mv $1 $2
  sleep 1
}

check_arguments "$ARG1" "$ARG2"

case "$SUBCOMMAND" in
  archive)
    archive "$ARG1" "$ARG2"
    ;;

  unarchive)
    unarchive "$ARG1" "$ARG2"
    ;;

  *)
    usage
    ;;
esac






