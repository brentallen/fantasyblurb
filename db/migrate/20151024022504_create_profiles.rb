class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :user_name
      t.string :location
      t.string :favorite_team
      t.text :description
      t.text :strategy
      
      t.timestamps
    end
  end
end
