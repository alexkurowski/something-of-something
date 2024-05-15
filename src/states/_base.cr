abstract class States::Base
  abstract def update
  abstract def cleanup(to_state : Symbol)
end
