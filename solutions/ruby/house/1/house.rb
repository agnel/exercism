=begin
Write your code for the 'House' exercise in this file. Make the tests in
`house_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/house` directory.
=end
module House
  CONSTITUENTS = [
    { noun: "the house that Jack built", verb: nil },
    { noun: "the malt", verb: "lay in" },
    { noun: "the rat", verb: "ate" },
    { noun: "the cat", verb: "killed" },
    { noun: "the dog", verb: "worried" },
    { noun: "the cow with the crumpled horn", verb: "tossed" },
    { noun: "the maiden all forlorn", verb: "milked" },
    { noun: "the man all tattered and torn", verb: "kissed" },
    { noun: "the priest all shaven and shorn", verb: "married" },
    { noun: "the rooster that crowed in the morn", verb: "woke" },
    { noun: "the farmer sowing his corn", verb: "kept" },
    { noun: "the horse and the hound and the horn", verb: "belonged to" },
  ]
  
  def self.recite(start_at = 1, end_at = 1)
    end_at = 12 if end_at > 12
    end_at = start_at if end_at < start_at

    n = end_at - start_at + 1
    n.times.map { |idx| "This is #{self.build_verses(start_at + idx - 1)}." }.join("\n") + "\n"
  end

  def self.build_verses(start)
    start.downto(0).map { |idx| self.construct_phrase(CONSTITUENTS[idx][:noun], CONSTITUENTS[idx][:verb]) }.join
  end

  def self.construct_phrase(noun, verb)
    verb ? "#{noun} that #{verb} " : noun
  end
end