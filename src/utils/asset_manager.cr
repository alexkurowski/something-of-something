class AssetManager
  getter :texture

  def initialize
    @texture = Raylib.load_texture "assets/thick_8x8.png"
    create_sprite_rectangles
  end

  def loaded?
    Raylib.texture_ready? @texture
  end

  def rect(sym)
    @rectangles[sym]
  end

  private def create_sprite_rectangles
    x = 0
    y = 0
    # TODO: create Raylib::Rectangle for each sprite
  end
end
