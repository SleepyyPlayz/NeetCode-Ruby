# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  # The idea is to use arrays of flags to keep track of which numbers
  # were encountered in each row, column, and box.
  # If there's a conflict, then the board is not valid.

  # First convert the characters to numbers ("." will be converted to 0)
  board.each_index do |i|
    board[i].each_index {|j| board[i][j] = board[i][j].to_i}
  end
  
  # 2D arrays to record whether a number occurred at a certain row / column / box
  row_occurred = Array.new(9) {Array.new(10, false)}
  col_occurred = Array.new(9) {Array.new(10, false)}
  box_occurred = Array.new(9) {Array.new(10, false)}  # boxes are numbered 0 to 8 ROW-WISE
  
  board.each_index do |i|
    board[i].each_index do |j| 
      if 1 <= board[i][j] and board[i][j] <= 9
        return false if row_occurred[i][ board[i][j] ]  # violation at current row
        return false if col_occurred[j][ board[i][j] ]  # violation at current column
        return false if box_occurred[3 * (i/3) + (j/3)][ board[i][j] ]  # violation at current box

        # update occurrence data of current number
        row_occurred[i][ board[i][j] ] = true
        col_occurred[j][ board[i][j] ] = true
        box_occurred[3 * (i/3) + (j/3)][ board[i][j] ] = true
      end
    end
  end

  return true
  
end
