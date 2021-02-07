.PHONY: usage shellcheck test install
default: usage

INSTALL_PATH=/usr/local/bin
SCRIPT_NAME=tfversion

# Display the help text dynamically.
# Any line with a ## will be rendered as part of the help text.
usage: Makefile
	@echo "tfversion: Build wrapper."
	@echo ""
	@echo "Usage:"
	@sed -n 's/^##//p' $<

## shellcheck: check for bugs in the script
shellcheck:
	shellcheck ${SCRIPT_NAME}

## test      : run tests using shellspec
test: shellcheck
	shellspec

## install   : install script into ${INSTALL_PATH}/${SCRIPT_NAME}
install: test
	cp ${SCRIPT_NAME} ${INSTALL_PATH}/${SCRIPT_NAME}
