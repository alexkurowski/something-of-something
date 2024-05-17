class Game
  include Concern::Assets
  include Concern::States
  include Concern::Input
  include Concern::Fade
  include Concern::World

  def update
    preupdate
    update_input
    update_state
    update_fade
    postupdate
  end

  private def preupdate
    Raylib.begin_drawing
    Raylib.clear_background(Raylib::RAYWHITE)
  end

  private def postupdate
    Raylib.end_drawing
  end
end
