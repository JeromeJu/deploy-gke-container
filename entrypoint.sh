#!/bin/sh -l

gke-deploy run -i "$1" -a "$2" -x "$3" -c "$4" -l "$5" -p "$6" -n "$7"