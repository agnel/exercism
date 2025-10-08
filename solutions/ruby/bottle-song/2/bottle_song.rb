class BottleSong
  WORDS = {
    10 => "Ten",
    9 => "Nine",
    8 => "Eight",
    7 => "Seven",
    6 => "Six",
    5 => "Five",
    4 => "Four",
    3 => "Three",
    2 => "Two",
    1 => "One",
    0 => "no",
  }
  
  def self.recite(bottles, verses)
    new(bottles, verses).to_s
  end

  def initialize(bottles, verses)
    @song = bottles.downto(bottles - verses + 1).map { |n|
        current_phrase = "#{WORDS[n]} green bottle#{n > 1 ? "s" : ""} hanging on the wall"
        next_phrase = "#{WORDS[n - 1].downcase} green bottle#{(n - 1) != 1 ? "s" : ""} hanging on the wall"
        
        <<~VERSE
          #{current_phrase},
          #{current_phrase},
          And if one green bottle should accidentally fall,
          There'll be #{next_phrase}.
        VERSE
      }.join("\n")
  end

  def to_s
    @song
  end
end
