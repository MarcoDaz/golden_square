def check_for_task(text)
    fail "Not a valid input" if text.length == 0
    
    return text.include?("#TODO")
end