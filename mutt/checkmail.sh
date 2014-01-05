#!/usr/bin/env bash

export PATH="/Users/dfm/bin:/usr/local/bin:${PATH}"
python -c'import sys, random; sys.exit(random.randint(0, 10))' && mbsync gmail-all || mbsync gmail-inbox
notmuch new
