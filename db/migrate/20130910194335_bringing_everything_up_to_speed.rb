class BringingEverythingUpToSpeed < ActiveRecord::Migration
  def change
    
    create_table "engagements", force: true do |t|
      t.string   "description"
      t.time     "engage_time"
      t.date     "engage_date"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    create_table "phones", force: true do |t|
       t.string   "phone_no"
       t.datetime "created_at"
       t.datetime "updated_at"
     end
    
  end
end
