class Group < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :members
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  validates_presence_of :name, :password
  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 3, :maximum => 80
  validates_length_of :password, :minimum => 6, :maximum => 18
  has_many :contacts
  
  def self.search(search)
      if search
        where('name LIKE ?', "%#{search}%")
      else
        scoped
      end
    end
  
end
