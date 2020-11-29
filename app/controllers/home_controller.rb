class HomeController < ApplicationController
  def index
  end

  def toogle_published
    @banner.toggle! :published
  end
end
