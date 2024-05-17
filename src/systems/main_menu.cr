class System::MainMenu < ECS::System
  PAD        =  8
  BTN_HEIGHT = 42

  @btn_counter = 0
  @rect = Raylib::Rectangle.new
  @mouse = Raylib::Vector2.new
  @mouse_down = false

  def filter(world)
    world.any_of [Component::MainMenuBtn]
  end

  def preprocess
    @btn_counter = 0
    @mouse = Raylib.get_mouse_position
    @mouse_down = Raylib.mouse_button_released? 0
  end

  def process(entity)
    btn = entity.get_main_menu_btn

    @rect.x = 10
    @rect.y = 10 + @btn_counter * (BTN_HEIGHT + PAD)
    @rect.width = 200
    @rect.height = BTN_HEIGHT

    mouse_hover = mouse_inside_rectangle?
    mouse_down = mouse_hover && @mouse_down

    color = if mouse_down
              Raylib::GRAY
            elsif mouse_hover
              Raylib::DARKGRAY
            else
              Raylib::BLACK
            end

    process_click btn.action if mouse_down

    Raylib.draw_rectangle @rect.x, @rect.y, @rect.width, @rect.height, color
    Raylib.draw_text btn.label, @rect.x + PAD * 2, @rect.y + PAD, @rect.height - PAD * 2, Raylib::WHITE

    @btn_counter += 1
  end

  private def mouse_inside_rectangle?
    G.input? &&
      @mouse.x >= @rect.x &&
      @mouse.y >= @rect.y &&
      @mouse.x <= @rect.x + @rect.width &&
      @mouse.y <= @rect.y + @rect.height
  end

  private def process_click(action : Symbol)
    return unless G.input?
    case action
    when :x_start_new_game
      G.set_state :game
    when :x_quit
      Raylib.close_window
    end
  end
end
