require 'pp'

class T9

  CHARS = [ nil, nil, %w(a b c), %w(d e f), %w(g h i), %w(j k l), %w(m n o), %w(p q r s), %w(t u v), %w(w x y z) ]

  def initialize
  end

  def decode_key k
    CHARS[k]
  end

  def words keys
    @buffer = nil
    keys.each do |key|
      chars = CHARS[key]
      if @buffer
        @buffer = fill @buffer, chars
      else
        @buffer = map_nil chars
      end
    end
    @buffer
  end

  def humanize keys
    hash = words keys
    extract(hash).flatten
  end

  # { 'd' => {'d' => nil, 'e' => nil , 'f' => nil }, 'e' => {'d' => nil, 'e' => nil , 'f' => nil }, 'f' => {'d' => nil, 'e' => nil , 'f' => nil } }
  def extract h
    h.collect do |k,v|
      if v
        extract(v).collect do |e|
          k + e
        end
      else
        k
      end
    end.flatten
  end

  def fill h, chars
    h.each do |k,v|
      if v then
        fill v,chars
      else
        h[k] = map_nil chars
      end
    end
    h
  end

  def map_nil arr
    hash = {}
    arr.each do |a|
      hash[a] = nil
    end
    hash
  end

end
