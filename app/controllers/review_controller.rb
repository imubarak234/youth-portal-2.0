class ReviewController < ApplicationController
  def index
    @group = Group.find_by(user: current_user)
    @member = Member.where(user: current_user)
  end

  def verified
    var = Member.where(user: current_user)
    count = []
    count1 = []
    count2 = []
    count3 = []

    var.each do |n|

    end
  end
end