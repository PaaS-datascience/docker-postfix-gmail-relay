SHELL=/bin/bash
include /etc/os-release

USE_TTY := $(shell test -t 1 && USE_TTY="-t")

OS_TYPE := $(shell cat /etc/os-release | grep -E '^NAME=' | sed 's/^.*debian.*$$/DEB/I;s/^.*ubuntu.*$$/DEB/I;s/^.*fedora.*$$/RPM/I;s/.*centos.*$$/RPM/I;')

dummy		    := $(shell touch artifacts)
include ./artifacts

up:
	docker-compose up -d

down:
	docker-compose down
