class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.string :name
      t.integer :fips
      t.integer :state_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
