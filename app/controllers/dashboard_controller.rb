class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    if Group.find_by(user_id: current_user.id) == nil
      Group.create(user_id: current_user.id, group_reach: current_user.group_size)
    end

    @member_count = Member.where(user: current_user).length

    @member = Member.where(user: current_user).limit(5).order(created_at: :desc)
  end

  
end