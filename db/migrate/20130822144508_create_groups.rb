class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :group_creator_id
      t.string :name
      t.integer :size
      t.string :password

      t.timestamps
    end
  end
end
