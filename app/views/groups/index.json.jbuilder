json.array!(@groups) do |group|
  json.extract! group, :group_creator_id, :name, :size, :password
  json.url group_url(group, format: :json)
end
