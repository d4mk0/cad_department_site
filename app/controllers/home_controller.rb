class HomeController < ApplicationController
  def page
    @page = Page.find_by permalink: params[:path]
    not_found unless @page.present?
  end

  def search
    @employees = Employee.search(params[:q])
    @news = News.search(params[:q])
    @ads = Ad.search(params[:q])
    @docs = Doc.search(params[:q])
    @pages = Page.search(params[:q])
  end
end
