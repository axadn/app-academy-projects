require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
   bucketid = get_bucket_number(key,@store.length)
   @store[bucketid].include?(key)
  end

  def set(key, val)
    resize! if @count > @store.length
    bucketid = get_bucket_number(key,@store.length)
    if include?(key)
      @store[bucketid].update(key,val)
    else
      @store[bucketid].append(key,val)
      @count += 1
    end
  end

  def get(key)
    bucketid = get_bucket_number(key,@store.length)
    @store[bucketid].get(key)
  end

  def delete(key)
    return unless include?(key)
    bucketid = get_bucket_number(key,@store.length)
    @store[bucketid].remove(key)
    @count -=1
  end

  def each(&prc)
    @store.each do |linkedlist|
      linkedlist.each{|node| prc.call(node.key,node.val)}
    end
  end


  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def get_bucket_number(item, num_buckets)
    item.hash % num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2 ) { LinkedList.new }
    @store.each do |linkedlist|
      linkedlist.each do |node|
        new_bucket_num = get_bucket_number(node.key,new_store.length)
        new_store[new_bucket_num].append(node.key,node.val)
      end
    end
    @store = new_store
  end

end
