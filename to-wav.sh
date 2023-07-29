#!/bin/bash

mkdir -p wavs/
MP3s=$(ls *.mp3)

for mp3 in ${MP3s[@]}; do
  PREFIX=$(echo $mp3 | sed 's/.mp3//g')
  echo $PREFIX
  rm wavs/$PREFIX.wav
  ffmpeg -i $PREFIX.mp3 -acodec pcm_s16le -ar 16000 -ac 1 wavs/$PREFIX.wav
done
