category_size_array = [
    ['2' ,'1'],['3' ,'1'],['4' ,'1'],['5' ,'1'],['6' ,'1'],['7' ,'1'],['8' ,'1'],['9' ,'1'],
    ['10' ,'1'],['11' ,'1'],['12' ,'1'],['13' ,'1'],['14' ,'1'],['15' ,'1'],['16' ,'1'],['17' ,'1'],
    ['18' ,'1'],['19' ,'1'],['20' ,'1'],['21' ,'1'],['22' ,'1'],['23' ,'1'],['24' ,'1'],['25' ,'1'],
    ['26' ,'1'],['27' ,'1'],['28' ,'1'],['29' ,'1'],['30' ,'1'],['31' ,'1'],['32' ,'1'],['33' ,'1'],['34' ,'1'],
    ['35' ,'1'],['36' ,'1'],['37' ,'1'],['38' ,'1'],['39' ,'1'],['40' ,'1'],['41' ,'1'],['42' ,'1'],['43' ,'1'],['44' ,'1'],['45' ,'1'],['46' ,'1'],['47' ,'1'],['48' ,'1'],['49' ,'1'],['50' ,'1'],
    ['51' ,'1'],['52' ,'1'],['53' ,'1'],['54' ,'1'],['55' ,'1'],['56' ,'1'],['57' ,'1'],['58' ,'1'],['59' ,'1'],['60' ,'1'],['61' ,'1'],['62' ,'1'],['63' ,'1'],['64' ,'1'],['65' ,'1'],['66' ,'1'],
    ['67' ,'1'],['68' ,'1'],['69' ,'1'],['70' ,'1'],['71' ,'1'],['72' ,'12'],['73' ,'12'],['74' ,'12'],['75' ,'12'],['76' ,'12'],['77' ,'12'],['78' ,'12'],['79' ,'12'],['80' ,'12'],
    ['81' ,'12'],['82' ,'12'],['83' ,'12'],['84' ,'1'],['85' ,'1'],['86' ,'1'],['87' ,'1'],['189' ,'1'],['190' ,'1'],['191' ,'1'],['195' ,'1'],['196' ,'1'],['197' ,'1'],['202' ,'1'],['206' ,'1'],['207' ,'1'],['208' ,'1'],['209' ,'1'],['210' ,'1'],['211' ,'1'],['212' ,'1'],['213' ,'1'],['214' ,'1'],['215' ,'1'],['216' ,'1'],['217' ,'1'],['218' ,'1'],['219' ,'1'],['220' ,'1'],['221' ,'1'],['222' ,'1'],['223' ,'1'],['224' ,'1'],['225' ,'1'],['226' ,'1'],['227' ,'1'],['228' ,'1'],['229' ,'1'],['230' ,'1'],['231' ,'1'],['232' ,'1'],['233' ,'1'],['234' ,'1'],['235' ,'1'],['236' ,'1'],['237' ,'1'],['238' ,'1'],['239' ,'1'],['240' ,'1'],['241' ,'1'],['242' ,'1'],['243' ,'1'],['244' ,'1'],['245' ,'1'],['246' ,'1'],['247' ,'1'],['248' ,'1'],['249' ,'1'],['250' ,'1'],['251' ,'1'],['252' ,'1'],['253' ,'1'],['254' ,'1'],['255' ,'1'],['256', '29'],['257', '29'],['258', '29'],['259', '29'],['260', '29'],['261', '29'],['262', '29'],['263', '29'],['264', '29'],['265', '29'],['266', '29'],['267', '29'],['268', '29'],['269', '29'],['270', '29'],['271', '29'],['272', '29'],['273', '29'],['274', '29'],['275', '29'],['276', '29'],['277', '29'],['278', '29'],['279', '29'],['280' ,'1'],['281' ,'1'],['282' ,'1'],['283' ,'1'],['284' ,'1'],['285' ,'1'],['286' ,'1'],['347' ,'1'],['348' ,'1'],['357' ,'1'],['358' ,'1'],['359' ,'1'],['360' ,'1'],['361' ,'1']
]
category_size_array.each do |category, size|
CategorySize.create!({ category_id: category, size_id: size})
end