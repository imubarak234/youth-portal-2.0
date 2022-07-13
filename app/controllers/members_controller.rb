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
    member_create = Member.new(params.require(:members).permit(:full_name, :member_role, :email, :phone_number, :active_region))
    member_create.update(user_id: current_user.id, group_id: Group.find_by(user_id: current_user.id).id)


    respond_to do |format|
      format.html do
        if member_create.save
          flash[:notice] = 'Member Created'
          redirect_to members_path
        else
          flash[:notice] = 'Error: Member not created'
          render :new, locals: { members: @member_new }
          # redirect_to members_new_path
        end
      end
    end
  end

  def edit
    @member_edit = Member.find(params[:id])
  end

  def update
    @member_edit = Member.find(params[:id])
    @member_edit.update(full_name: params[:member][:full_name], member_role: params[:member][:member_role], email: params[:member][:email], phone_number: params[:member][:phone_number], active_region: params[:member][:active_region])
    flash[:notice] = "Updated"
    redirect_to members_path
  end
end
