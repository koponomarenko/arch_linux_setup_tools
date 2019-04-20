#!/bin/bash
. fcommon_helpers/unctions.sh

# TODO: https only, reliable counrty / even reliable server

# TODO: check if the server synced 100%

# TODO: How often server can be changed?

# Aim at 'upgrade only' - no downgrade. - pkglist on the server

# Goals by priority:
# 1. stability
# 2. security

# TODO: can a mirror be compromised?
# TODO: package signing?
### Possible solutions:
# use Reflector
# use preselected few mirrors and check their status before each update.


#TODO: maybe use only https mirrors?
# select a good mirror
# https
# Completion: 100%
# μ Delay < 1h
    # maybe - georgaphically close
    # σ Duration maybe not bigger than  # A high standard deviation can indicate an unstable or overloaded mirror.
