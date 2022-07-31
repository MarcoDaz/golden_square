def estimate_readtime(text)
    words = text.split((" "))
    return (words.length / 200.to_f).ceil 
end