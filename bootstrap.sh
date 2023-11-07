# The config sync root directory.
# See https://stackoverflow.com/a/246128
#
# Bootstrap is always directly in the root dir.
export DOTFILES_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

dotfu_conf_dir="${HOME}/.config/dotfu"
echo "Generating dotfu config in ${dotfu_conf_dir}."
mkdir -p $dotfu_conf_dir
echo "export DOTFILES_DIR=${DOTFILES_DIR}" > "${dotfu_conf_dir}/environment_variables"
echo "Done"

echo "Running 'dotfu install bash'..."
"${DOTFILES_DIR}"/scripts/dotfu install bash
echo "Done."
