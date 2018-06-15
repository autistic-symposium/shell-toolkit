#!/bin/bash
VM=vm_dev
rsync -avz -e ssh <local dir> ${VM}:<remote dir> --exclude-from ~/.rsync-excludes
