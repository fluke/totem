class Contact < ActiveRecord::Base
  belongs_to :group
  has_many :phone_numbers
  has_many :engagements
end
