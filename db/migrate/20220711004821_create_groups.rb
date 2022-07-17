class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.integer :year_of_establishment
      t.string :nature_of_support_group
      t.string :mode_of_funding
      t.text :constitution_of_group
      t.string :state
      t.text :recommendation
      t.text :guarantor
      t.string :lga
      t.text :address
      t.string :active_region
      t.integer :number_of_members
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
