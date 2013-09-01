# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    name "MyString"
    group_id 1
    added_by 1
    email_id "MyString"
    facebook_id "MyString"
    skype_id "MyString"
    twitter_id "MyString"
    engagement_count 1
  end
end
