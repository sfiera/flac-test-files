FLAC test files
---------------

These [FLAC](https://xiph.org/flac/) files are suitable for testing the channel mapping of a surround-sound system. They use the following channel assignments, taken from the [FLAC spec](https://xiph.org/flac/format.html#frame_header):

  * [stereo.flac](stereo.flac): FL FR
  * [center.flac](center.flac): FL FR FC
  * [quad.flac](quad.flac): FL FR RL RR
  * [surround50.flac](surround50.flac): FL FR FC RL RR
  * [surround51.flac](surround51.flac): FL FR FC LFE RL RR
  * [surround61.flac](surround61.flac): FL FR FC LFE RC SL SR
  * [surround71.flac](surround71.flac): FL FR FC LFE RL RR SL SR

(FL/FR/FC is Front Left/Right/Center, RL/RR/RC is Rear, SL/SR is Side, and LFE is low frequency effects for the subwoofer)

License
-------

GPLv2. See [COPYING](COPYING).

The wav recordings in the [alsa/](alsa/) directory come from [alsa-utils](http://www.alsa-project.org/), which is also under the GPLv2.
