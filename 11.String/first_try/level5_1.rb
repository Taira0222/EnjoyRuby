def normalize_keywords(arr)
    arr.map(&:capitalize)
end

keywords = ["rAils", "ruBY", "SInatRa"]
p normalize_keywords(keywords)