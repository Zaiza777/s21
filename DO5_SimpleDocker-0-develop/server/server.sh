#!/bin/bash

service nginx start
spawn-fcgi -p 8080 ./xxx
tail -f /dev/null