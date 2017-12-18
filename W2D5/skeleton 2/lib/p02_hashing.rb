class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return nil.hash if empty?
    store = []
    each_with_index do |el, idx|
      store << (el.hash * idx.hash)
    end
    store.reduce(:^)
  end
end

class String
  def hash
    self.chars.map{ |el| el.ord }.hash
  end

end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    return nil.hash if empty?
    store = []
    each  do |k,v|
      store << (k.hash ^ v.hash)
    end
    store.reduce(:+)
  end
end
