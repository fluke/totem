class Phone < ActiveRecord::Base
	belongs_to :contact
	validates_presence_of :phone_no
end
