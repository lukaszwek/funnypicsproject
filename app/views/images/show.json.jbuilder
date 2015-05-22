json.(@image, :id, :title, :created_at, :updated_at)
json.author do
  json.nick @image.user.nick
  json.email @image.user.email
end
json.versions do
  json.original do
    json.url @image.image.url
  end

  json.medium do
    json.url @image.image.url(:medium)
  end

  json.thumb do
    json.url @image.image.url(:thumb)
  end
end
