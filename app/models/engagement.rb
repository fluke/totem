class Engagement < ActiveRecord::Base
	belongs_to :contact
	validates_presence_of :description, :engage_date

	validates_date :engage_date, :on_or_after => lambda { Date.current }
	validates_time :engage_time
end
