local mysql = require'mysql'

local conn = mysql.connect('192.168.100.167', 'root', nil, 'kslave', 'utf8', 3388)
conn:query("select mid, gemnum from ks_gem")
local result = conn:store_result()

print('Found:')
for i, mid, gemnum in result:rows() do
  print('  ' .. mid)
end

print()
for i, mid, gemnum in result:rows() do
  print(mid.." "..gemnum)
  print()
end

result:free()
conn:close()