#!/usr/bin/env python

import os

host = '--host %s' % os.environ['MONGO_HOST']
port = '--port %s' % os.environ['MONGO_PORT']
dbname = '-d %s' % os.environ['MONGO_DB_NAME']
options = '%s %s %s' % (host, port, dbname)

print(options)
