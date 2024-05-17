module Concern::Input
  @mouse_position : Raylib::Vector2 = Raylib::Vector2.new
  getter mouse_position

  @window_size : Raylib::Size = Raylib::Size.new
  getter window_size

  def input?
    not fading?
  end

  def update_input
    @mouse_position.x = Raylib.get_mouse_x
    @mouse_position.y = Raylib.get_mouse_y
    @window_size.w = Raylib.get_render_width
    @window_size.h = Raylib.get_render_height
  end
end
