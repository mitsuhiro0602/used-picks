json.array! @items do | item |
  json.name item.name
  json.image item.image_url
  json.price item.initial_price
end
