#!/bin/bash

set -u

if [[ "$PWD" != "$(cd "$(dirname "$0")" && pwd)" ]]; then
  echo "The script must be run from within its directory."
  exit 1
fi

TARGET="$HOME/.config/sublime-merge"

# editorconfig
rm -f "$TARGET/.editorconfig"
ln -s "$PWD/.editorconfig" "$TARGET/.editorconfig"

# settings
for SETTING in "Commit Message.sublime-settings" \
  "Default (Linux).sublime-keymap" \
  "Diff.sublime-settings" \
  "Preferences.sublime-settings"; do
  rm -f "$TARGET/Packages/User/$SETTING"
  ln -s "$PWD/settings/$SETTING" "$TARGET/Packages/User/$SETTING"
done
