# pytorch-dev-podcasts-transcribe

There's a treasure trove of content in [PyTorch dev
podcasts](https://pytorch-dev-podcast.simplecast.com/episodes), that I appreciate.

I find text faster to follow than than audio, so I'm just transcribing it using
[whisper.cpp](https://github.com/ggerganov/whisper.cpp)

```bash
python3 download.py
bash to-wav.sh 
bash transcribe.sh
```
