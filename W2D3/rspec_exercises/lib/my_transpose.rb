class Array
  def my_transpose
    col_size = self.first.length
    result = []
    0.upto(col_size - 1) do |idx2|
      col = []
      self.each do |row|
        col << row[idx2]
      end
      result << col
    end
    result
  end
end
