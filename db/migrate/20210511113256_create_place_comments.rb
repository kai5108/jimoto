class CreatePlaceComments < ActiveRecord::Migration[5.2]
  def change
    create_table :place_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :place_id
      t.string :title
      t.float :rate

      t.timestamps
    end
  end
end
