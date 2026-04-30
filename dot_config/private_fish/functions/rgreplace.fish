function rgreplace -a old new
  set -l apply_changes 0
  for arg in $argv
    switch $arg
      case -y --yes
        set apply_changes 1
    end
  end

  rg $old --replace $new
  if test $apply_changes -eq 0
    read -P "Apply changes? [y/N] " confirm
    if test "$confirm" = y -o "$confirm" = Y
      set apply_changes 1
    end
  end

  if test $apply_changes -eq 1
    rg "$old" -l | xargs sed -i "s/$old/$new/g"
  end
end

