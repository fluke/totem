class Contact < ActiveRecord::Base
  belongs_to :group
  has_many :phone_numbers, :dependent => :destroy
  has_many :engagements, :dependent => :destroy
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 3, :maximum => 80

  extend FriendlyId
   friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
       new_record?
   end
  
  
end
