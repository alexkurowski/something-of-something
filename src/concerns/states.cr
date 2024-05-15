module Concerns::States
  alias SomeState = ::States::Base

  @state_name = :loading
  @state : SomeState = ::States::Loading.new

  def update
    @state.update
  end

  def set_state(new_state)
    @state.cleanup new_state

    case new_state
    when :main_menu
      @state = ::States::MainMenu.new
    else
      raise "Unknown state #{new_state}"
    end

    @state_name = new_state
  end
end
