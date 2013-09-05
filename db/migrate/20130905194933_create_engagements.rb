class CreateEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|
      t.string :description
      t.time :engage_time
      t.date :engage_date

      t.timestamps
    end
  end
end
