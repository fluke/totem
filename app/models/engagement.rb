class Engagement < ActiveRecord::Base
  belongs_to :contact, :counter_cache => true
end
