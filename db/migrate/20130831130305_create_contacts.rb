class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :group_id
      t.integer :added_by
      t.string :email_id
      t.string :facebook_id
      t.string :skype_id
      t.string :twitter_id
      t.integer :engagement_count

      t.timestamps
    end
  end
end
