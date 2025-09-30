=begin
Write your code for the 'Rotational Cipher' exercise in this file. Make the tests in
`rotational_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rotational-cipher` directory.
=end
module RotationalCipher
  ORD_A_LOWERCASE = "a".ord
  ORD_A_UPPERCASE = "A".ord
  def self.rotate(str, key)
    str.chars.map do |char|
      if char >= "A" and char <= "Z"
        rotate_char(char, key, ORD_A_UPPERCASE)
      elsif char >= "a" and char <= "z"
        rotate_char(char, key, ORD_A_LOWERCASE)
      else
        char
      end
    end.join
  end

  def self.rotate_char(char, key, base)
    ((char.ord - base + key) % 26 + base).chr
  end
end