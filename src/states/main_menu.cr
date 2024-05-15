class States::MainMenu < States::Base
  def update
    Raylib.begin_drawing
    Raylib.clear_background(Raylib::RAYWHITE)

    # Raylib.draw_texture_rec(@assets.texture, @foo, @bar, Raylib::BLACK)
    # DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint);
    Raylib.draw_text("Game loaded! This will be the main menu!", 10, 20, 20, Raylib::BLACK)
    Raylib.end_drawing
  end

  def cleanup(to_state)
  end
end
