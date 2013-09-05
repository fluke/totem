class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone_no

      t.timestamps
    end
  end
end
