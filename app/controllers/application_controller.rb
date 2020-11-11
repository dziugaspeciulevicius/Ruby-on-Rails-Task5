class ApplicationController < ActionController::Base
  before_action :is_paid?
  def is_paid?
    # check if user has paid for da memes
    # if not paid then restrict access

  end
end
