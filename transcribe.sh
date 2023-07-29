#/bin/bash

WHISPER_SRC=$HOME/code/whisper.cpp

WAVS=$(find wavs/*.wav)

for wav in ${WAVS[@]}; do
  wav_path=$(realpath $wav)
  set -x
  # $WHISPER_SRC/build/bin/main -m $WHISPER_SRC/models/ggml-base.en.bin -f $wav_path --output-txt
  $WHISPER_SRC/build/bin/main -m $WHISPER_SRC/models/ggml-base.en.bin -f $wav_path --output-srt -t 8 -p 1
done
