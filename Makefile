# Copyright 2016 Google Inc.
# This program is licensed under the terms of the GNU GPLv2; see COPYING. 

FL=alsa/Front_Left.wav
FR=alsa/Front_Right.wav
FC=alsa/Front_Center.wav
RL=alsa/Rear_Left.wav
RR=alsa/Rear_Right.wav
RC=alsa/Rear_Center.wav
SL=alsa/Side_Left.wav
SR=alsa/Side_Right.wav
LFE=alsa/Noise.wav

OUT=stereo.flac \
	center.flac \
	quad.flac \
	surround50.flac \
	surround51.flac \
	surround61.flac \
	surround71.flac

all: $(OUT)

stereo.flac: $(FL) $(FR)
	src/join.py $+ $@

center.flac: $(FL) $(FR) $(FC)
	src/join.py $+ $@

quad.flac: $(FL) $(FR) $(RL) $(RR)
	src/join.py $+ $@

surround50.flac: $(FL) $(FR) $(FC) $(RL) $(RR)
	src/join.py $+ $@

surround51.flac: $(FL) $(FR) $(FC) $(LFE) $(RL) $(RR)
	src/join.py $+ $@

surround61.flac: $(FL) $(FR) $(FC) $(LFE) $(RC) $(SL) $(SR)
	src/join.py $+ $@

surround71.flac: $(FL) $(FR) $(FC) $(LFE) $(RL) $(RR) $(SL) $(SR)
	src/join.py $+ $@

clean:
	rm -f $(OUT)
