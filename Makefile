.PHONY: shellcheck test install
default: test

shellcheck:
	shellcheck tfversion

test: shellcheck
	shellspec

install: test
	cp tfversion /usr/local/bin/tfversion
