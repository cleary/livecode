#!/bin/bash

# Generate a strudel.json file suitable for use with https://strudel.cc
# This script expects a number of subdirs containing .wav files
#
# Copyright (c) 2024 by Bernard Gray <bernard.gray@gmail.com>
# based on generateAudioResources.sh from the estuary project by David Ogborn
# https://github.com/dktr0/estuary
#
# License: GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
#
# Usage: 
# 1. Update the BASE variable to the url prefix of your choice 
# 2. Run: 
#      ./generateStrudelJSON.bash <path_to_dir_of_sample_folders> > strudel.json
#
# Example: ./generateStrudelJSON.bash ./ > strudel.json
#
# Includes:
# Support for pitch information, it looks for info at the end of the
# filename, eg: 
#  - bassclarinet-B3.wav
#  - sax-cs3.wav (sharps, doesn't support flat yet)
#  - subbass-F-1.wav (very low bass octave support)
#
# Edge cases:
#  - handles folders of mixed pitched and unpitched samples
#     by leaving them all unpitched
#
# Validating output:
#  - use jq to validate the output before writing to file, eg:
#      ./script.sh | jq
#    if this throws an error, there's some edge case I haven't handled

BASE="https://samples.grbt.com.au/"

printf "{\n"
printf "\"_base\": \"%s\",\n" "${BASE}"
dircount=0
find $1 -mindepth 1 -maxdepth 1 -type d | sort | while read d; do
    dirname=`basename ${d}`
    if [[ ${dircount} -ne 0 ]]; then
        printf ",\n"
    fi
    # check if we have pitched samples
    # make sure they are all pitched, otherwise our json breaks
    count_pitched=$(find "${d}" -regextype posix-extended -iregex '.*([a-g]|[A-G])(s?|S?)-?[0-8]\.wav' | wc -l)
    count_unpitched=$(find "${d}" -iname "*.wav" | wc -l)
    if [[ ${count_pitched} -eq ${count_unpitched} ]]; then
        open_brkt='{'
        close_brkt='}'
        pitched=true
    else
        open_brkt='['
        close_brkt=']'
        pitched=false
    fi
    printf "\"%s\": ${open_brkt}" "${dirname}"
    filecount=0
    find "${d}" -iname "*.wav" | sort | while read f; do
      if [[ ${filecount} -ne 0 ]]; then
          printf ","
      fi
      filename=$(printf %q "${f}")
      basename=${f##*/}
      if [[ ${basename:0:1} != "." ]]; then
        # regex to check if there is pitch info at the end of the filename
        # eg foo_c0.wav, foo_cs0.wav etc
        if [[ "${filename}" =~ ([a-g]|[A-G])(s?|S?)-?[0-8]\.wav ]] && \
            [ ${pitched} = true ]; then 
            note=$(echo ${filename} | grep -oP '([a-g]|[A-G])(s?|S?)-?[0-9].wav')
            printf "\"%s\": \"%s/%s\"" "${note%%.wav}" "${dirname}" "${basename}"
        else
            printf "\"%s/%s\"" "${dirname}" "${basename}"
        fi
        (( filecount++ ))
      fi
    done
    printf "${close_brkt}" "${dirname}"
    (( dircount++ ))
done
printf "\n}\n"
