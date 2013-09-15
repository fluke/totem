class Contact < ActiveRecord::Base
  belongs_to :group
  has_many :phones, :dependent => :destroy
  accepts_nested_attributes_for :phones, :reject_if => :all_blank, :allow_destroy => true
  has_many :engagements, :dependent => :destroy
  
  validates_presence_of :name
  validates_format_of :email_id, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "Bad Email format"
  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 3, :maximum => 80

  extend FriendlyId
   friendly_id :name, use: :slugged

   def should_generate_new_friendly_id?
       new_record?
   end
  
   def self.search(search)
     if search
       where('lower(name) LIKE ?', "%#{search}%")
     else
       scoped
     end
   end
  
end
