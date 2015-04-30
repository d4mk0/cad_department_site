class HomeController < ApplicationController
  def page
    @page = Page.find_by permalink: params[:path]
    not_found unless @page.present?
  end
end
