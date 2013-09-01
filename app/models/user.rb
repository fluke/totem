class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_and_belongs_to_many :groups, :join_table => :members
         has_many :owned_groups, class_name: "Group", foreign_key: :user_id
end
