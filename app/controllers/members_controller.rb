class MembersController < ApplicationController
  before_action :authenticate_user!
  def index
    @member = Member.where(user: current_user)
  end
end
