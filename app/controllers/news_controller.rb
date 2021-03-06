class NewsController < InheritedResources::Base

  before_action :increase_views, only: [:show]

  def index
    @news = News.for_front.page(params[:page]).per(params[:per_page])
  end

  private
  def news_params
    params.require(:news).permit(:title, :short_description, :text, :published)
  end

  def increase_views
    resource.increment!(:views)
  end
end

