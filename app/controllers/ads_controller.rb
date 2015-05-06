class AdsController < InheritedResources::Base

  def index
    @ads = Ad.for_front.page(params[:page]).per(params[:per_page])
  end

end

