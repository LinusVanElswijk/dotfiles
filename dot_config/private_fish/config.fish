if status is-interactive
    if type -q keychain
        set -l tmp $SHELL
        set SHELL (which  fish)
        keychain --eval --quiet -Q | source
        trap 'echo "SIGINT -> keychain unlock skipped"' SIGINT
        keychain id_ed25519 --quiet -Q
        trap - SIGINT
        set SHELL $tmp
    end
end

if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish --cmd e | source
end

if type -q yazi
  function y
      set tmp (mktemp -t "yazi-cwd.XXXXXX")
      yazi $argv --cwd-file="$tmp"
      if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          builtin cd -- "$cwd"
      end
      rm -f -- "$tmp"
  end
end

if test -e /home/linus/go/bin
  set PATH $PATH /home/linus/go/bin
end

if test -e /home/linus/.local/bin
  set PATH $PATH /home/linus/.local/bin
end
