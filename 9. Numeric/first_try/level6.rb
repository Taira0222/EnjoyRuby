z1 = Complex(3, 4)
z2 = Complex(1, -2)

z_total = z1 + z2
z_diff = z1 - z2
z_times = z1 * z2
z_slash = z1 / z2

puts "足し算: #{z_total}"
puts "引き算: #{z_diff}"
puts "掛け算: #{z_times}"
puts "割り算: #{z_slash}"

z1_abs = z1.abs
z2_abs = z2.abs

z1_arg = z1.arg
z2_arg = z2.arg

puts "絶対値: #{z1_abs}"
puts "絶対値: #{z2_abs}"
puts "偏角: #{z1_arg}"
puts "偏角: #{z2_arg}"