class MembersController < ApplicationController
  before_action :authenticate_user!
  def index
    @member = Member.where(user: current_user)
  end

  def new
    @member_new = current_user.members.new
    respond_to do |format|
      format.html { render :new, locals: { members: @member_new } }
    end
  end

  def create
    member_create = Member.new(params.require(:member).permit(:full_name, :member_role, :email, :phone_number, :active_region))
    member_create.update(user_id: current_user.id)
    

    respond_to do |format|
      if member_create.save
        flash[:notice] = 'Member Created'
        redirect_to members_path
      else
        flash[:notice] = 'Error: Member not created'
        render :new, locals: { members: @member_new }
      end
    end
  end
end
