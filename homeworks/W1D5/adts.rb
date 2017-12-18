class Stack
  def initialize
    @stack= Array.new
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = Array.new
  end

  def enque(el)
    @queue.unshift(el)
  end

  def deque
    @queue.pop
  end
  def show
    @queue
  end
end

class Map
  def initialize
    @map = [[]]
  end

  def assign(key,val)
    found = false
    @map.each do |pair|
      if pair.first == key
        found = true
        pair[1] = val
      end
    end
    @map << [key,val] unless found
  end

  def show
    @map
  end

  def lookup(key)
    val = nil
    @map.each do |pair|
       val = pair.last if pair.first == key
    end
    val
  end

  def remove(key)
    @map.each_with_index do |pair, i|
      @map.delete_at(i) if pair.first == key
    end
  end
end
