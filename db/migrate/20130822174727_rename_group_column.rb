class RenameGroupColumn < ActiveRecord::Migration
    def change
        rename_column :groups, :group_creator_id, :user_id
        rename_column :members, :joined_group_id, :user_id
        rename_column :members, :membership_id, :group_id
      end
end
