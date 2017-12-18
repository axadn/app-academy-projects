require "byebug"

class LRUCache
    def initialize(max_len)
      @max_len = max_len
      @hash = {}
      @head = nil
      @tail = nil
    end

    def count
      @hash.length
    end

    def add(el)
      if count == @max_len
        remove_least_recent
      end
      append_to_end(el)
    end

    def show
      vals = []
      node = @head
      until node == nil
        vals << node.val
        node = node.child
      end
      vals
    end

    private
    # helper methods go here!
    def append_to_end(val)
      node = Node.new(val)
      @hash[node] = node
      if @tail.nil? || @head.nil?
        @tail = node
        @head = node
      else
        @tail.child = node
        node.parent = @tail
        @tail = node
      end
    end


    def remove_least_recent
      @hash.delete(@head)
      @head = @head.child
      @head.parent = nil
    end
end

  class Node
    attr_accessor :child, :parent, :key, :val
    def initialize(val)
      @val = val
    end
  end
