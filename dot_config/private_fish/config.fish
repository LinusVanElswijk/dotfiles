if status is-interactive
    if type -q keychain
        set -l tmp $SHELL
        set SHELL (which  fish)
        keychain --eval --quiet -Q | source
        set SHELL $tmp
    end
end

if type -q starship
    starship init fish | source
end
