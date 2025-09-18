readonly TARGET_GO_VERSION="go1.22.1"

NEEDS_INSTALL=false
CURRENT_GO_VERSION=""

if ! command -v go &>/dev/null; then
	echo "Go is not installed."
	NEEDS_INSTALL=true
else
	CURRENT_GO_VERSION=$(go version | awk '{print $3}')

	if [ "$CURRENT_GO_VERSION" != "$TARGET_GO_VERSION" ]; then
		NEEDS_INSTALL=true
	fi
fi

if [ "$NEEDS_INSTALL" = true ]; then
	FILENAME="${TARGET_GO_VERSION}.linux-amd64.tar.gz"
	DOWNLOAD_URL="https://go.dev/dl/${FILENAME}"

	cd /tmp

	curl -LO "$DOWNLOAD_URL"

	if [ $? -eq 0 ]; then
		sudo rm -rf /usr/local/go
		sudo tar -C /usr/local -xzf "${FILENAME}"
	fi
fi
