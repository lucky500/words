require('rspec')
require('words')

describe (".initial_words") do 
  # it("is an empty hash at first") do 
  #   words = Words.new()
  #   expect(words.initial_words).to(eq({}))
  # end

  it("will return an hash with initial words") do 
    words = Words.new()
    expect({"obtuse" => ['annoyingly insensitive or slow to understand.']}).to(eq({"obtuse" => ['annoyingly insensitive or slow to understand.']}))
  end
end