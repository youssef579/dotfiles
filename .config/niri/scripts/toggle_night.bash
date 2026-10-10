#!/bin/bash
current=$(dms ipc call night status)
if [[ "$current" == *"disabled"* ]]; then
  dms brightness set backlight:intel_backlight 10
else
  dms brightness set backlight:intel_backlight 50
fi
dms ipc call night toggle
