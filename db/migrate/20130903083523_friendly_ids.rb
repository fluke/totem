class FriendlyIds < ActiveRecord::Migration
  def change
    add_column :groups, :slug, :string
    add_index :groups, :slug
    
    add_column :contacts, :slug, :string
    add_index :contacts, :slug
  end
end
