class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    if Group.find_by(user_id: current_user.id) != nil
      Group.create(user_id: current_user.id)
    end
  end
end