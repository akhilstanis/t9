require 'bloomfilter-rb'

class T9

  CHARS = [ nil, nil, %w(a b c), %w(d e f), %w(g h i), %w(j k l), %w(m n o), %w(p q r s), %w(t u v), %w(w x y z) ]

  def initialize
    @words = BloomFilter::Native.load '/Users/akhil/Desktop/ruby/T9/lib/words'
  end

  def valid_words_using keys
    combinations(keys).select do |combination|
      @words.include? combination
    end
  end

  def combinations keys
    temp = []
    combinations = CHARS[keys.shift]
    keys.each do |key|
      combinations.each do |combination|
        temp += CHARS[key].collect do |char|
          combination + char
        end
      end
      combinations = temp
      temp =[]
    end
    combinations
  end

end
