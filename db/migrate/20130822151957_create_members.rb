class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :joined_group_id
      t.integer :membership_id

      t.timestamps
    end
  end
end
