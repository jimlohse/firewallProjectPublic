#!/bin/bash
#

for filename in emerging*.rules; do
  ../../snort2lua -c $filename -r emerging3/$filename.temp
  sed 's/fast_pattern\:only/fast_pattern\,nocase/' emerging3/$filename.temp >> emerging3/$filename
  rm emerging3/$filename.temp
done
