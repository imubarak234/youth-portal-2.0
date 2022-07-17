class AddNameToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :name_of_support_group, :string
  end
end
