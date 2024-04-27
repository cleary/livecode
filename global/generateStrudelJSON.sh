#/bin/sh

#
# Generate a strudel.json file suitable for use with https://strudel.cc
# This script expects a number of subdirs containing .wav files
#
# Copyright (c) 2024 by Bernard Gray <bernard.gray@gmail.com>
# based on generateAudioResources.sh from the estuary project by David Ogborn
# https://github.com/dktr0/estuary
#
# License: GPLv3 https://www.gnu.org/licenses/gpl-3.0.html

BASE="https://samples.grbt.com.au/"

printf "{\n"
printf "\"_base\": \"%s\",\n" "${BASE}"
dircount=0
find $1 -mindepth 1 -maxdepth 1 -type d | sort | while read d; do
    dirname=`basename $d`
    # testing
    if [[ $dircount -ne 0 ]]; then
        printf ",\n"
    fi
    printf "\"%s\": [" "$dirname"
    search2=$searchRoot/$dirname/*.WAV
    filecount=0
    find "$d" -iname "*.wav" | sort | while read f; do
    # for f in $search2; do
      if [[ $filecount -ne 0 ]]; then
          printf ","
      fi
      filename=$(printf %q "$f")
      basename=${f##*/}
      if [[ ${basename:0:1} != "." ]]; then
        printf "\"%s/%s\"" "$dirname" "$basename"
        (( filecount++ ))
      fi
    done
    printf "]" "$dirname"
    (( dircount++ ))
done
printf "\n}\n"
