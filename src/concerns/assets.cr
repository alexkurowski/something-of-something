module Concern::Assets
  @assets = AssetManager.new

  def loaded?
    @assets.loaded?
  end

  def rect(str)
    @assets.rect str
  end

  def texture
    @assets.texture
  end
end
