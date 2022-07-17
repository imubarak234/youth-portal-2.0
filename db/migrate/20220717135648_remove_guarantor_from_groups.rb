class RemoveGuarantorFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :guarantor, :string
    remove_column :groups, :recommendation, :string
    remove_column :groups, :constitution_of_group, :string
    remove_column :groups, :address, :string
  end
end
