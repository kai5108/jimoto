class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.text :name
      t.string :image_id
      t.text :capitan
      t.string :user_id
      t.string :address

      t.timestamps
    end
  end
end
