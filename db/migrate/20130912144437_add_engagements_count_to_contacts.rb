class AddEngagementsCountToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :engagements_count, :integer, :default => 0
    remove_column :contacts, :engagement_count
  end
end
