module Concern::States
  @state : State::Base = State::Loading.new
  @state_name = :loading
  @next_state_name : Symbol | Nil

  def set_state(new_state_name : Symbol)
    unless @state_name == new_state_name
      @next_state_name = new_state_name
      start_fade
    end
  end

  def update_state
    @state.update
  end

  private def switch_to_next_state
    next_state_name = @next_state_name
    return if next_state_name.nil?

    @state.cleanup next_state_name

    case next_state_name
    when :game
      @state = State::Game.new
    when :main_menu
      @state = State::MainMenu.new
    else
      raise "Unknown state #{next_state_name}"
    end

    @state_name = next_state_name
    @next_state_name = nil

    @state.init
  end
end
