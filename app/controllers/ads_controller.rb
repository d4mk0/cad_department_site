class AdsController < InheritedResources::Base

  def index
    @ads = Ad.for_front.without_employers.page(params[:page]).per(params[:per_page])
  end

  def employment
    @ads = Ad.for_front.from_employers.page(params[:page]).per(params[:per_page])
  end

  def create
    Ad.create params.require(:ad).permit(:title, :text).merge(category: 'from_employers')
    flash[:notice] = "Ваша заявка была отправлена. После модерации объявление будет показано."
    redirect_to employment_ads_path
  end

end

