class ReviewController < ApplicationController
  def index
    @group = Group.find_by(user: current_user)
    @member = Member.where(user: current_user)
  end 
end