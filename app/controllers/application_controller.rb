class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protect_from_forgery with: :null_session

  before_action :update_allowed_parameters, if: :devise_controller?

  def json_payload
    HashWithIndifferentAccess.new(JSON.parse(request.raw_post))
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :group_size, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :group_size, :password, :current_password)
    end
  end

  def authenticate_user!
    if user_signed_in?
      super
    elsif request.original_fullpath != home_path
      redirect_to home_path, notice: 'if you want to add a notice'
    end
    ## if you want render 404 page
    ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
  end
end
