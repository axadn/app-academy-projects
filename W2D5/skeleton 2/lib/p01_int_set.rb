require 'byebug'
class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max + 1) {false}
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @max
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[get_bucket_number(num)] << num
  end

  def remove(num)
    bucket_num = get_bucket_number(num)
    @store[bucket_num].delete(num)
  end

  def include?(num)
    bucket_num = get_bucket_number(num)
    @store[bucket_num].include?(num)
  end

  private

  def get_bucket_number(num)
    num % @store.length
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)



    unless include?(num)
      @store[get_bucket_number(num, @store.length)] << num
      @count += 1
    end
    if @count > num_buckets
      resize!
    end
  end

  def remove(num)
    if include?(num)
      bucket_num = get_bucket_number(num, @store.length)
      @store[bucket_num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket_num = get_bucket_number(num, @store.length)
    @store[bucket_num].include?(num)
  end

  private

  def get_bucket_number(num, num_buckets)
    num % num_buckets
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
