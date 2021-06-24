#!/usr/bin/env python3

import os

host = '--host %s' % os.environ['MONGO_HOST']
port = '--port %s' % os.environ['MONGO_PORT']
options = '%s %s' % (host, port)

print(options)
