#!/bin/bash

scp -i/root/.ssh/id_rsa release/* root@10.0.3.16:/usr/local/bin
