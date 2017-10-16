class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! #devise method authenticate user-  ,only: [:Create] - can use
  # this code only when you authenticate user when you create a post

  protected
  def after_sign_in_path_for(resource)
    # resource is a class init of User (instance of a user)

    if resource.profile == nil
      # redirect_to profile/new
      new_profile_path

    end

      profile_path resource
  end

end
