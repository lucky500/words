require('rspec')
require('words')

describe(Word) do
  before() do
    Word.clear()
  end


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

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      word = Word.new({:word => 'obtuse', :definition => 'annoyingly insensitive or slow to understand.'})
      word.save()
      word2 = Word.new({:word => 'tsar', :definition => 'a person appointed by government to advise on and coordinate policy in a particular area'})
      word2.save()
      expect(word.id()).to(eq(1))
      expect(word2.id()).to(eq(2))
    end
  end

  describe(".find") do
    it("finds an item based on its id") do
      word = Word.new({:word => 'obtuse', :definition => 'annoyingly insensitive or slow to understand.'})
      word.save()
      word2 = Word.new({:word => 'tsar', :definition => 'a person appointed by government to advise on and coordinate policy in a particular area'})
      word2.save()
      word2.save()
      expect(Word.find(1)).to(eq(word))
      expect(Word.find(2)).to(eq(word2))
    end
  end
end
