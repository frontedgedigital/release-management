#!/usr/bin/env bash
set -e

THIS_ABSPATH="$(cd "$(dirname "$0")"; pwd)"
TYPES=${@:-nodejs chart version image nodejs+image csharp}

for type in $TYPES; do
  export TEST_DOCKER=
  export NO_USE_LOCAL_NODEJS=1
  export NO_USE_LOCAL_NPM=1
  export NO_USE_LOCAL_FX=1
  export NO_USE_LOCAL_MATCH=1
  "$THIS_ABSPATH/test.sh" "$type"

  export TEST_DOCKER=1
  "$THIS_ABSPATH/test.sh" "$type"
done
