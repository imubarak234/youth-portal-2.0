class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @group = Group.find_by(user_id: current_user.id)
    @user = current_user
  end

  def show
    if current_user.role = "Admin"
      @group_show = Group.find(params[:id])
      @group_user = User.find(@group_show.user_id)
    else
      redirect_to dashboard_path
    end
  end

  def new
    @group_new = current_user.groups.new
    respond_to do |format|
      format.html { render :new, locals: { groups: @group_new } }
    end
  end

  def create
    group_create = Group.new(params.require(:groups).permit(:year_of_establishment, :nature_of_support_group, :mode_of_funding, :state, :lga, :active_region, :number_of_members, :head_office_address, :focus_of_support_group, :zonal_office_address, :region_of_operation, :geo_political_zone, :branch_offices, :senatorial_district, :name_of_support_group, :membership_status))
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
    @group_edit = Group.find(params[:id])
  end

  def update
    @group_edit = Group.find(params[:id])
    @group_edit.update(year_of_establishment: params[:group][:year_of_establishment], nature_of_support_group: params[:group][:nature_of_support_group], mode_of_funding: params[:group][:mode_of_funding], head_office_address: params[:group][:head_office_address], state: params[:group][:state], focus_of_support_group: params[:group][:focus_of_support_group], zonal_office_address: params[:group][:zonal_office_address], lga: params[:group][:lga], address: params[:group][:address], active_region: params[:group][:active_region], number_of_members: params[:group][:number_of_members], region_of_operation: params[:group][:region_of_operation], geo_political_zone: params[:group][:geo_political_zone], branch_offices: params[:group][:branch_offices], senatorial_district: params[:group][:senatorial_district], name_of_support_group: params[:group][:name_of_support_group], membership_status: params[:group][:membership_status])
    flash[:notice] = "Updated"
    redirect_to groups_path
  end
end
