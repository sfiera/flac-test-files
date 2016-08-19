#!/usr/bin/env python
#
# Copyright 2016 Google Inc.
# This program is licensed under the terms of the GNU GPLv2; see COPYING. 

import os
import subprocess
import sys
import tempfile

def main():
    progname = os.path.basename(sys.argv[0])
    in_paths = sys.argv[1:-1]
    out_path = sys.argv[-1]
    if not in_paths:
        sys.stderr.write("usage: %s IN [IN...] OUT\n" % progname)
        sys.exit(64)
    join(in_paths, out_path)

def join(in_paths, out_path):
    nchannels = len(in_paths)
    tmpdir = tempfile.mkdtemp()
    intermediates = []
    for channel, in_path in enumerate(in_paths):
        intermediates.append("%s/%d.wav" % (tmpdir, channel))
        assign(in_path, channel, nchannels, intermediates[-1])
    cmd = ["sox"] + intermediates + [out_path]
    subprocess.check_call(cmd)

def assign(in_path, channel, nchannels, out_path):
    inputs = ((["-n"] * channel) +
              [in_path] +
              (["-n"] * (nchannels - channel - 1)))
    cmd = ["sox", "-M"] + inputs + [out_path, "trim", "0", "2"]
    subprocess.check_call(cmd)

if __name__ == "__main__":
    main()
