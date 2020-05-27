item_state_array = ['下書き', '出品中', 'コメント中', '売却']
item_state_array.each_with_index do |is|
    ItemState.create(state: is)
end