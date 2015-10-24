class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :team

      t.timestamps
    end
  end
end
