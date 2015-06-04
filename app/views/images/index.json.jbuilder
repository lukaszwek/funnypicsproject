json.array!(@images) do |image|
  json.extract! image, :id, :title
  json.url image_url(image, format: :json)
  json.author image.user.nick
  json.thumb image.image.url(:thumb)
end
