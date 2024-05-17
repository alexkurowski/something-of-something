module Concern::Fade
  enum FadeMotion
    None
    In
    Out
  end

  FADE_SPEED = 0.05

  @fade_motion : FadeMotion = FadeMotion::None
  @fade_value = 0

  def fading?
    @fade_motion != FadeMotion::None
  end

  def start_fade
    @fade_motion = FadeMotion::Out
  end

  def update_fade
    if @fade_motion == FadeMotion::In
      @fade_value -= FADE_SPEED
      if @fade_value <= 0
        @fade_value = 0
        @fade_motion = FadeMotion::None
      end
    elsif @fade_motion == FadeMotion::Out
      @fade_value += FADE_SPEED
      if @fade_value >= 1
        @fade_value = 1
        @fade_motion = FadeMotion::In
        switch_to_next_state
      end
    end

    Raylib.draw_rectangle 0, 0, @window_size.w, @window_size.h, Raylib.fade Raylib::BLACK, @fade_value
  end
end
