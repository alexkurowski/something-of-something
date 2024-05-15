module Concerns::Assets
  @assets : AssetManager = AssetManager.new

  def loaded?
    @assets.loaded?
  end
end
