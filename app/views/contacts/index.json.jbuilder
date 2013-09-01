json.array!(@contacts) do |contact|
  json.extract! contact, :name, :group_id, :added_by, :email_id, :facebook_id, :skype_id, :twitter_id, :engagement_count
  json.url contact_url(contact, format: :json)
end
