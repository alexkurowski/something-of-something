class AssetManager
  @texture : Raylib::Texture
  @rectangle = Raylib::Rectangle.new
  @sprites = Hash(Symbol, Raylib::Vector2).new

  getter :texture

  def initialize
    @texture = Raylib.load_texture "assets/texture.png"
    @rectangle.width = 16
    @rectangle.height = 16

    set_sprite :nil, 0, 0
    set_sprite :floor1, 1, 0
    set_sprite :wall1, 1, 1
    set_sprite :character1, 1, 2
  end

  def loaded?
    Raylib.texture_ready? @texture
  end

  def rect(name : Symbol) : Raylib::Rectangle
    @rectangle.x = @sprites[name].x
    @rectangle.y = @sprites[name].y
    return @rectangle
  end

  private def set_sprite(name : Symbol, x : Int32, y : Int32)
    @sprites[name] = Raylib::Vector2.new
    @sprites[name].x = x * @rectangle.width
    @sprites[name].y = y * @rectangle.height
  end
end
