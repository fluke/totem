class AddContactIdToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :contact_id, :integer
  end
end
