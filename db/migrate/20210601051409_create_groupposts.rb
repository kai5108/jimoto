class CreateGroupposts < ActiveRecord::Migration[5.2]
  def change
    create_table :groupposts do |t|
      t.string :user_id
      t.string :group_id
      t.text :content

      t.timestamps
    end
  end
end
