brand_array = ['CHANEL', 'GUCCI', 'supreme', 'ADIDAS', 'NIKE', 'PUMA']
brand_array.each_with_index do |bra|
    Brand.create(brand_name: bra)
end