#!/bin/bash
current=$(dms ipc call night status)
if [ "$current" = "Night mode is disabled" ]; then
  dms ipc call brightness set 10 backlight:intel_backlight
else
  dms ipc call brightness set 50 backlight:intel_backlight
fi
dms ipc call night toggle
