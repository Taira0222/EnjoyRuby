users = {}

users[1] = 'Takeshi'
users[2] = 'Hanako'
users[3] = 'Toshimi'

p users.has_key?(1)
p users.has_key?(4)

p users.delete(2)

users.each do |key, value|
    puts "ID:#{key} Name:#{value}"
end