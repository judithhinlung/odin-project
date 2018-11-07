# Caesar Cipher from the Odin Project curriculum:  https://www.theodinproject.com/courses/ruby-programming/lessons/building-blocks?ref=lnav
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
    return letter
  end
  cap_start = 'A'.ord
  low_start = 'a'.ord
  if is_upper(letter)
    start = cap_start
  else
    start = low_start
  end
  mod_letter = (letter.ord + shift - start)
  if mod_letter >= 26
    if is_upper(letter)
      start = low_start
    else
      start = cap_start
    end
  end
  mod_letter = start + mod_letter % 26
  return mod_letter.chr
end
# returns a new string with characters modified by the shift factor
# str: string for encryption
# shift: shift factor
def caesar_cipher(str, shift)
  new_str = []
  str = str.split('')
  str.each do |x| 
    new_str << letter_cipher(x, shift) 
  end
  new_str = new_str.join
  puts new_str
  return new_str
end

caesar_cipher("George Washington is the first US president", 4)
