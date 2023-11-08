# The config sync root directory.
# See https://stackoverflow.com/a/246128
#
# Bootstrap is always directly in the root dir.
export DOTFILES_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

dotfu_conf_dir="${HOME}/.config/dotfu"
echo "Generating dotfu config in ${dotfu_conf_dir}."
mkdir -p $dotfu_conf_dir

env_var_file="${dotfu_conf_dir}/environment_variables"
touch env_var_file
echo "export DOTFILES_DIR=${DOTFILES_DIR}" >> $env_var_file
echo "export DOTFILES_INSTALL_DIR=${DOTFILES_INSTALL_DIR:-~}" >> $env_var_file

echo "Running 'dotfu install bash'..."
"${DOTFILES_DIR}"/scripts/dotfu install bash

echo "Putting a link to dotfu in ${HOME}/bin."
link_dest="${HOME}/bin/dotfu"
if [[ -L ${link_dest} ]] ; then
  rm $link_dest
fi
ln -s $DOTFILES_DIR/scripts/dotfu $link_dest
echo "Done."
