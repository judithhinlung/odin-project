# Caesar Cipher from the Odin Project curriculum: 
# Determine whether a character is a letter
def letter?(char)
 char[/[a-zA-Z]/] == char
end

# Determine whether a letter is uppercase
def is_upper(letter)
 letter == letter.upcase
end

# Modifies a single letter by the shift factor
def letter_cipher(letter, shift)
 if not letter?(letter)
  puts letter
 else
  if is_upper(letter)
    start = 'A'.ord
  else
    start = 'a'.ord
  end
  mod_letter = (letter.ord - start + shift)%26
  mod_letter += start
  print mod_letter.chr
 end
end
# returns a new string with characters modified by the shift factor
# str: string for encryption
# shift: shift factor
def caesar_cipher(str, shift)
 str.scan(/./) { |x| letter_cipher(x, shift) }
end
