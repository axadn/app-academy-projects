class Array

  def two_sum
    result = []
    0.upto(self.length - 2) do |idx1|
      (idx1 + 1).upto(self.length - 1) do |idx2|
        result << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    result
  end

end
