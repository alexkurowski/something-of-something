class State::Loading < State::Base
  def init
  end

  def update
    # Draw loading screen
    Raylib.clear_background(Raylib::BLACK)
    Raylib.draw_text("Loading...", 10, 10, 20, Raylib::WHITE)
  end

  def cleanup(next_state : Symbol)
  end
end
