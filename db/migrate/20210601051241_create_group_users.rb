class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_users do |t|
      t.string :user_id
      t.string :gr_id

      t.timestamps
    end
  end
end
