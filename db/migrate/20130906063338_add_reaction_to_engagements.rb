class AddReactionToEngagements < ActiveRecord::Migration
  def change
    add_column :engagements, :reaction, :string
  end
end
