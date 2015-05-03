class AdsController < InheritedResources::Base

  def index
    @ads = Ad.published	
  end

end

