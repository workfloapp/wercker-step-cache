#!/bin/bash

#========================================================
# Script for storing and restoring cached directories
#
# See http://devcenter.wercker.com/docs/pipelines/wercker-cache.html
#========================================================

WERCKER_CACHE_SEPARATOR=${WERCKER_CACHE_SEPARATOR:-" "}

main() {
  IFS=$WERCKER_CACHE_SEPARATOR directories=($WERCKER_CACHE_DIRECTORIES)

  # set source and destination directories
  case $WERCKER_CACHE_ACTION in
    "store")
      SRC=$HOME
      DST=$WERCKER_CACHE_DIR
      ;;
    "restore")
      SRC=$WERCKER_CACHE_DIR
      DST=$HOME
      ;;
  esac

  # run rsync
  for directory in "${directories[@]}"; do
    if test -d "${SRC}/${directory}"; then
      echo "sync ${SRC}/${directory} ${DST}/"
      rsync -avz "${SRC}/${directory}" "${DST}/"
    fi
  done

}

main
