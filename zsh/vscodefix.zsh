# detect if we are in a vscode remote session based on the env variable VSCODE_INJECTION set or not
if [[ ! -z "${VSCODE_INJECTION}" ]]; then
  # cleanup left over broken symlinks from previous sessions
  find /run/user/$(id -u)/vscode-ssh-auth-sock* -xtype l -delete
  # re-link expected symlink with the 1st found, silent fail if link exists already
  ln -s $(ls -l /run/user/$(id -u)/vscode-ssh-auth-sock* | awk '{print $11}' | head -n 1) \
    $SSH_AUTH_SOCK 2> /dev/null
fi
