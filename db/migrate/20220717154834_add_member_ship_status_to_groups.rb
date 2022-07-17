class AddMemberShipStatusToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :membership_status, :string
    add_column :groups, :group_reach, :string
  end
end
