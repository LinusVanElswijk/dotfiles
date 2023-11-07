# The config sync root directory.
# See https://stackoverflow.com/a/246128
#
# Bootstrap is always directly in the root dir.
export DOTFILES_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

echo "Running 'dotfu install bash'..."
"${DOTFILE_DIR}"/scripts/dotfu install bash
echo "Done."

