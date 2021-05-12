class CreatePlaceComments < ActiveRecord::Migration[5.2]
  def change
    create_table :place_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end
  end
end
