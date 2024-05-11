#!/bin/bash

set -e
set -o pipefail
set -x

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROOT_DIRECTORY="${SCRIPT_DIRECTORY}/.."

# Build the package.

cd "$ROOT_DIRECTORY"

xcodebuild -scheme TagField -showdestinations
xcodebuild -scheme TagField -destination "platform=macOS" clean build
xcodebuild -scheme TagField -destination "platform=iOS Simulator,name=iPhone 14 Pro" clean build

# Build the example project.

cd "$ROOT_DIRECTORY/Example"

# N.B. We skip code-signing to allow us to sign without a development certificate; this is fine for builds but wouldn't
# allow us to run the app for local testing.
xcodebuild \
    -scheme Example \
    CODE_SIGN_IDENTITY="" \
    CODE_SIGNING_REQUIRED=NO \
    CODE_SIGNING_ALLOWED=NO \
    -configuration \
    Debug \
    build
