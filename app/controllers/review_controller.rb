class ReviewController < ApplicationController
  def index
    @group = Group.find_by(user: current_user)
    @member = Member.where(user: current_user)
  end

  def is_verified
    var = Member.where(user: current_user)
    count_charmain = []
    count_vice = []
    count_secretary = []
    count_legal = []

    var.each do |n|
      if n.member_role == "Chairman"
        count_charmain.push(1)
      elsif n.member_role == "Vice Chairman"
        count_vice.push(1)
      elsif n.member_role == "General Secretary"
        count_secretary.push(1)
      elsif n.member_role == "Legal Advisor"
        count_legal.push(1)
      end

      count_charmain.length > 0 && count_vice.length > 0 && count_secretary.length > 0 && count_legal.length > 0
    end
  end

  def verified
  end
end