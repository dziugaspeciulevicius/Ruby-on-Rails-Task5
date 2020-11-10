class ApplicationController < ActionController::Base
  # functions we want to check if user is signed in ?????? idk just watching the vid
  # so it should show if user is signed in, there are other options u can add like :edit, :update blah blah blah
  before_action :signed_in_user, only: [:show]
  def signed_in_user
    unless signed_in?
      store_location redirect_to signin_url, flash:{warning: "Please sign up"}
    end


  end
end
