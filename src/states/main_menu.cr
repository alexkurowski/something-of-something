class State::MainMenu < State::Base
  def initialize
    @systems = ECS::Systems.new G.world

    @systems.add System::MainMenu
    @systems.init

    @camera = Raylib::Vector2.new
    @camera.x = -16
    @camera.y = -32
  end

  def init
    G.world.new_entity.add(
      Component::MainMenuBtn.new("New game", false, :x_start_new_game)
    )
    G.world.new_entity.add(
      Component::MainMenuBtn.new("Load", false, :x_load_game)
    )
    G.world.new_entity.add(
      Component::MainMenuBtn.new("Options", false, :x_open_options)
    )
    G.world.new_entity.add(
      Component::MainMenuBtn.new("Exit", false, :x_quit)
    )
  end

  def update
    @systems.execute

    # @camera.x -= 0.3
    # r = Raylib::Rectangle.new
    # r.width = 32
    # r.height = 32
    # x = 0
    # y = 0
    # while x < 50
    #   while y < 30
    #     r.x = x * 32
    #     r.y = y * 32

    #     if x == 0 || y == 0 || x == 49 || y == 29
    #       Raylib.draw_texture_pro G.texture, G.rect("wall3"), r, @camera, 0, Raylib::WHITE
    #     else
    #       Raylib.draw_texture_pro G.texture, G.rect("floor3"), r, @camera, 0, Raylib::WHITE
    #     end

    #     y += 1
    #   end
    #   y = 0
    #   x += 1
    # end

    # Raylib.draw_texture_rec(@assets.texture, @foo, @bar, Raylib::BLACK)
    # DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint);
    # Raylib.draw_text("Game loaded! This will be the main menu!", 10, 20, 20, Raylib::BLACK)
  end

  def cleanup(next_state : Symbol)
    @systems.teardown
    G.world.delete_all
  end
end
