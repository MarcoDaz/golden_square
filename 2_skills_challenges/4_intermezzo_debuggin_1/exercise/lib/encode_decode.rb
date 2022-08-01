def encode(plaintext, key)
    # cipher tells us how far to the right is a character from a
    # i.e if cipher is "zbt..." t is 3 away from a so t => c
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    ciphertext_chars = plaintext.chars.map do |char|
        (65 + cipher.find_index(char.downcase)).chr
    end
    return ciphertext_chars.join
end
  
def decode(ciphertext, key)
    # if we check how far the character is from a in the alphabet
    # i.e. b - a => 66 - 65 => 1 away => cipher[1] is the decoded character
    # that tells us where it's decoded character is in the cipher
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    plaintext_chars = ciphertext.chars.map do |char|
        cipher[char.ord - 65]
    end
    return plaintext_chars.join
end