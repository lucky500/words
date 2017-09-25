require('pry')

class Word
  @@words =[]

  attr_reader(:id)
  attr_accessor(:word, :definition)

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @definitions = []
    @id = @@words.length + 1
  end

  def self.all()
    @@words
  end

  def save
    @@words.push(self)
  end

  def self.clear
    @@words = []
  end

  def add_definition(definition)
    @definitions.push(definition)
  end

  def self.find(id)
    word_id = id.to_i()
    @@words.each do |word|
      if word.id == word_id
        return word
      end
    end
  end
end
