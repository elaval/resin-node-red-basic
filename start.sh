#!/bin/bash
udevd &
udevadm trigger
node-red-pi --max-old-space-size=128 --userDir /app/myNode-red -v