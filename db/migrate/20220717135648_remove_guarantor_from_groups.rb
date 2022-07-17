class RemoveGuarantorFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :guarantor, :string
    remove_column :groups, :recommendation, :string
    remove_column :groups, :constitution_of_group, :string
    remove_column :groups, :address, :string
    add_column :groups, :head_office_address, :string
    add_column :groups, :focus_of_support_group, :string
    add_column :groups, :zonal_office_address, :string 
    add_column :groups, :region_of_operation, :string
    add_column :groups, :geo_political_zone, :string
    add_column :groups, :branch_offices, :string
    add_column :groups, :senatorial_district, :string
  end
end
