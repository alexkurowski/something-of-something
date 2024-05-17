abstract class State::Base
  abstract def init
  abstract def update
  abstract def cleanup(next_state : Symbol)
end
