require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(item)
    unless include?(item)
      @store[get_bucket_number(item, @store.length)] << item
      @count += 1
    end
    if @count > num_buckets
      resize!
    end
  end

  def remove(item)
    if include?(item)
      bucket_num = get_bucket_number(item, @store.length)
      @store[bucket_num].delete(item)
      @count -= 1
    end
  end

  def include?(item)
    bucket_num = get_bucket_number(item, @store.length)
    @store[bucket_num].include?(item)
  end

  private

  def get_bucket_number(item, num_buckets)
    item.hash % num_buckets
  end

  def num_buckets
    @store.length
  end


  def resize!

    new_store = Array.new(num_buckets * 2 ) { Array.new }
    @store.each do |bucket|
      bucket.each do |val|
      new_bucket_num = get_bucket_number(val, new_store.length)
      new_store[new_bucket_num] << (val)
      end
    end
    @store = new_store
  end

end
