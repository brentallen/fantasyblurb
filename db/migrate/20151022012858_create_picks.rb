class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string :player
      t.text :idea

      t.timestamps
    end
  end
end
