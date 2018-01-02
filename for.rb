require 'pry'
x = 500

for i in 0..359
  y = x + (x * 0.0079).to_f.round(2)
  puts (x * 0.0079).to_f.round(2)
  puts y.to_f.round(2)
  x = y + 500

end
