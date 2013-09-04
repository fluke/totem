class Contact < ActiveRecord::Base
  belongs_to :group
  has_many :phone_numbers
  has_many :engagements
  
  extend FriendlyId
   friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
       new_record?
     end
  
  
end
