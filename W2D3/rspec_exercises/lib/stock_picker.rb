def stock_picker(arr)
  result = [0,0]
  difference = 0
  (0...(arr.length - 1)).each do |idx1|
    ((idx1 + 1)...arr.length).each do |idx2|
      if arr[idx2] - arr[idx1] > difference
        result  = [idx1, idx2]
        difference = arr[idx2] - arr[idx1]
      end
    end
  end
  result
end
