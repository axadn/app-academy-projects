def sluggish_biggest_fish(fishes)
  fishes.each_with_index do |fish0, idx0|
    biggest = true
    fishes.each_with_index do |fish1, idx1|
      next if fish1 == fish2
      biggest = false if fish1.length > fish0.length
    end
    return fish0 if biggest
  end
end

def dominant_biggest_fish(fishes)
  fishes = fishes.merge_sort
  fishes.last
end

def clever_biggest_fish(fishes)
  return nil if fishes.empty?
  biggest = fishes[0]
  1.upto(fishes.length - 1) do |idx|
    biggest = fishes[idx] if fishes[idx] > biggest
  end
  biggest
end


def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end


class Array
  def merge_sort(&prc)
    prc = prc  || :<=>.to_proc
    return self if length <= 1
    left = self[0...length/2]
    right = self[length/2..-1]
    merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  def merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      comparison = prc.call(left.first, right.first, &prc)
      case comparison
      when 0
        merged << left.shift
        merged << right.shift
      when 1
        merged << right.shift
      when -1
        merged << left.shift
      end
    end

    merged.concat(left)
    merged.concat(right)
  end
end
