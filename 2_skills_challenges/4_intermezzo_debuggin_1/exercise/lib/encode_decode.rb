def encode(plaintext, key)
    # cipher tells us how far to the right is a character from a
    # i.e for below if cipher is "zbt..." t is 3 away from a so it becomes c
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    ciphertext_chars = plaintext.chars.map do |char|
        (65 + cipher.find_index(char.downcase)).chr
    end
    return ciphertext_chars.join
end
  
def decode(ciphertext, key)
    # if we check how far the character is from a in the alphabet
    # that tells us where it's decoded character is in the cipher
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    plaintext_chars = ciphertext.chars.map do |char|
        # (66 instead of 65 because arrays start at 0)
        cipher[66 - char.ord]
    end
    return plaintext_chars.join
end