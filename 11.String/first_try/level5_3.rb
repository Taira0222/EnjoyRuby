def sanitize_comment(input_string)
    input_string.delete('<>').tr('　',' ')
end

p sanitize_comment("ここは <危険> な場所　です。")