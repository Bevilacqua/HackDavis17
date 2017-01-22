json.array! @items do |item|
    json.id item.id
    json.title  item.title
    json.body  item.body
    json.image_url item.image_url
    json.updated_at time_ago_in_words(item.updated_at) + " ago"
end

