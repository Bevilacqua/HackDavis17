json.array! @items do |item|
    json.id item.id
    json.title  item.title
    json.body  item.body
    json.updated_at  item.updated_at
end
    