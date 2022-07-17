class AddMemberShipStatusToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :membership_status, :string
  end
end
