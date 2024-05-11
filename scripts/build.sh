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
# xcodebuild -scheme TagField -destination "platform=iOS Simulator,name=iPhone 14 Pro" clean build


# Build the example project.

cd "$ROOT_DIRECTORY/Example"

xcodebuild -scheme Example -configuration Debug build
