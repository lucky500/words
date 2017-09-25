require('rspec')
require('words')

# describe (".clear") do
#   it("is an empty hash at first") do
#     words = Words.new()
#     expect(words.initial_words).to(eq({}))
#   end
# end

describe(Word) do
  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an item to the list of items") do
      word = Word.new({:word => 'obtuse'})
      word.save()
      expect(Word.all()).to(eq([word]))
    end
  end

  describe(".clear") do
    it("clears all the words and definitions from a list") do
      word = Word.new({:word => 'obtuse', :definition => 'annoyingly insensitive or slow to understand. '})
      word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end
end
