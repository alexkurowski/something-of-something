class States::Loading < States::Base
  def update
    # Draw loading screen
    Raylib.begin_drawing
    Raylib.clear_background(Raylib::BLACK)
    Raylib.draw_text("Loading...", 10, 10, 20, Raylib::WHITE)
    Raylib.end_drawing
  end

  def cleanup(to_state)
  end
end
