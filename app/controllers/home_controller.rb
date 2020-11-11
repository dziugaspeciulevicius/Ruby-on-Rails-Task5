class HomeController < ApplicationController
  # before_action :set_post, only: [:edit, :show]
  def index
  end

  def toogle_published
    @banner.toggle! :published
  end
end
