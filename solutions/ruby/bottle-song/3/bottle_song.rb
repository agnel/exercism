class BottleSong
  WORDS = {
    0 => 'no',
    1 => 'One',
    2 => 'Two',
    3 => 'Three',
    4 => 'Four',
    5 => 'Five',
    6 => 'Six',
    7 => 'Seven',
    8 => 'Eight',
    9 => 'Nine',
    10 => 'Ten'
  }.freeze

  attr_reader :song

  def self.recite(bottles, verses)
    new(bottles, verses).to_s
  end

  def initialize(bottles, verses)
    @song = bottles.downto(bottles - verses + 1).each_with_object('') do |n, full_song|
      current_phrase = phrase(n)
      next_phrase = phrase(n - 1, lowercase: true)

      full_song << format(
        "%s,\n%s,\nAnd if one green bottle should accidentally fall,\nThere'll be %s.\n\n",
        current_phrase, current_phrase, next_phrase
      )
    end.strip + "\n"
  end

  def to_s
    song
  end

  private

  def pluralize(count)
    count == 1 ? "" : "s"
  end

  def phrase(count, lowercase: false)
    word = WORDS[count]
    word = word.downcase if lowercase
    "#{word} green bottle#{pluralize(count)} hanging on the wall"
  end
end
