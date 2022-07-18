class ReviewController < ApplicationController
  before_action :authenticate_user!
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
      case n.member_role
      when 'Chairman'
        count_charmain.push(1)
      when 'Vice Chairman'
        count_vice.push(1)
      when 'General Secretary'
        count_secretary.push(1)
      when 'Legal Advisor'
        count_legal.push(1)
      end
    end
    count_charmain.length.positive? && count_vice.length.positive? && count_secretary.length.positive? && count_legal.length.positive?
  end

  def verified
    if is_verified
      current_user.update(verified: true)
      flash[:notice] = 'Group is verified'
      redirect_to dashboard_path
    else
      flash[:notice] = 'Group not verfied'
      redirect_to review_path
    end
  end
end
