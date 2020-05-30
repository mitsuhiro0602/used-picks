brand_array = ['CHANEL', 'GUCCI', 'supreme', 'ADIDAS', 'NIKE', 'PUMA']
brand_array.each_with_index do |bra|
    Brand.create(brand_name: bra)
end

brand_array = ['シャネル', 'グッチ', 'スプリーム', 'アディダス', 'ナイキ', 'プーマ']
brand_array.each_with_index do |bra|
    Brand.create(brand_name_kana: bra)
end