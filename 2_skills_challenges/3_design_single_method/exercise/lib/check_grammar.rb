def check_grammar(text)
    fail "Not a sentence." if text.length == 0
    
    is_capitalized = text[0] == text[0].upcase

    correct_endings = /[.!?]/ 
    check_end = text[-1] =~ correct_endings ? true : false

    return is_capitalized && check_end
end