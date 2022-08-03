def factorial(n)
    product = n
    
    while n > 1
        n -= 1
        product *= n
    end

    return product
end