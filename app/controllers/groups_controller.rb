class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @group = Group.find_by(user_id: current_user.id)
    @user = current_user
  end

  def new
    @group_new = current_user.groups.new
    respond_to do |format|
      format.html { render :new, locals: { groups: @group_new } }
    end
  end

  def create
    group_create = Group.new(params.require(:groups).permit(:year_of_establishment, :nature_of_support_group, :mode_of_funding, :constitution_of_group, :state, :recommendation, :guarantor, :lga, :address, :active_region, :number_of_members))
    group_create.update(user_id: current_user.id)

    respond_to do |format|
      format.html do
        if group_create.save
          flash[:notice] = "Successfully Created"
          redirect_to groups_path
        else
          flash[:notice] = 'Error: Group was not created'
          render :new, locals: { groups: @group_new }
        end
      end
    end
  end

  def edit
  end

  def update
  end
end
