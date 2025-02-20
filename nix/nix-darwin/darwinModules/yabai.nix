{...}: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      layout = "bsp";
      top_padding = 10;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;
      window_gap = 10;
    };
    extraConfig = ''
      yabai -m space 1 --label one
      yabai -m space 2 --label two
      yabai -m space 3 --label three
      yabai -m space 4 --label four
      yabai -m space 5 --label five
      yabai -m space 6 --label six
      yabai -m space 9 --label nine

      # float system preferences. Most of these just diable Yabai form resizing them.
      yabai -m rule --add app="^System Settings$" sticky=on sub-layer=above manage=off
      yabai -m rule --add app="^BetterTouchTool$" sticky=on sub-layer=above manage=off
      yabai -m rule --add app="^Finder$" sticky=on sub-layer=above manage=off
      yabai -m rule --add app="^Disk Utility$" sticky=on sub-layer=above manage=off
      yabai -m rule --add app="^System Information$" sticky=on sub-layer=above manage=off
      yabai -m rule --add app="^Activity Monitor$" sticky=on sub-layer=above manage=off
      yabai -m rule --add app="^Self-Service$" sticky=on sub-layer=above manage=off
      yabai -m rule --add app="^Path Finder$" manage=off
      yabai -m rule --add app="Fantastical" manage=off
      yabai -m rule --add app="^iTerm2$" manage=off
      yabai -m rule --add app="^WezTerm$" manage=off
      yabai -m rule --add app="^Ghostty$" manage=off
      yabai -m rule --add app="^1Password" manage=off
      yabai -m rule --add app="Raycast" manage=off

      # New window spawns to the right if vertical split, or bottom if horizontal split
      yabai -m config focus_follows_mouse autofocus
      yabai -m config window_placement second_child

      yabai -m config window_opacity off
      # yabai -m config window_opacity_duration 0.25
      # yabai -m config active_window_opacity 1.0
      # yabai -m config normal_window_opacity 0.9

      ## some other settings
      yabai -m config auto_balance off
      yabai -m config split_ratio 0.50
      # # set mouse interaction modifier key (default: fn)
      yabai -m config mouse_modifier ctrl
      # set modifier + right-click drag to resize window (default: resize)
      yabai -m config mouse_action2 resize
      # set modifier + left-click drag to resize window (default: move)
      yabai -m config mouse_action1 move

      # general space settings
      #yabai -m config focused_border_skip_floating  1
      #yabai -m config --space 3 layout             float
    '';
  };
}
