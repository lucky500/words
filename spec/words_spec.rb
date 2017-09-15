require('rspec')
require('words')

describe (".all") do 
  it("is an empty hash at first") do 
    words = Words.new()
    expect(words.initial_words).to(eq({}))
  end
end