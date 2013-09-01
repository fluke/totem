# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    group_creator_id 1
    name "MyString"
    size 1
    password "MyString"
  end
end
