Raylib.init_window 800, 450, "Hello World"
Raylib.set_target_fps 60

G = Game.new

until Raylib.close_window?
  G.update
  break if G.loaded?
end

G.set_state :main_menu

until Raylib.close_window?
  G.update
end

Raylib.close_window
