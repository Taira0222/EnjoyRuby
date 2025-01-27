def extract_user_id(your_id)
    head_str = 'ID-'
    return nil unless your_id.start_with?(head_str)

    user_part = your_id.slice(head_str.size, your_id.size - head_str.size)
    return nil unless user_part =~ /\A[A-Za-z\d]+\z/
    return nil if user_part.size > 10
    user_part
end

p extract_user_id("ID-abc123")
p extract_user_id("ID-somethinglongerthanten") 
p extract_user_id("ABC-xyz99") 