# @itemsを配列形式にして変数itemに分解する
# これによってitemsという配列id,nameなどが変数として使える
json.array! @items do |item|
  json.id item.id
  json.name item.name
  json.image item.image_url
  json.price item.initial_price
end
