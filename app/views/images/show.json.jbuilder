json.(@image, :id, :title, :created_at, :updated_at)
json.author do
  json.nick @image.user.nick
  json.email @image.user.email
end
json.versions do
  json.original @image.image_base64(:original)

  json.medium @image.image_base64(:medium)

  json.thumb @image.image_base64(:thumb)
end
