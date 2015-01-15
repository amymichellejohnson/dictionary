class Term
  @@all_words =[]

  define_method(:initialize) do |word, definition|
    @word = word
    @definition = definition
  end

  define_method(:word) do
    @word
  end

  define_method(:definition) do
    @definition
  end

  define_singleton_method(:all) do
    @@all_words
  end

  define_method(:save) do
    @@all_words.push(self)
  end

  define_singleton_method(:list) do
    word_array = []
    @@all_words.each do |term|
      word_array.push(term.word())
    end
    word_array
  end

  define_singleton_method(:clear) do
    @@all_words = []
  end

  define_singleton_method(:search) do |word|
    search_array = []
    @@all_words.each do |word_pair|
      word_pair.word().each do |multilingual_word|
        if multilingual_word == word
          search_array.push(word_pair.word())
          search_array.push(word_pair.definition())
        end
      end
    end
    search_array
  end

end
