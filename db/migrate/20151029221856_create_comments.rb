class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :pick_id
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
    add_index :comments, :pick_id
  end
end
