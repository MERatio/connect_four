# frozen_string_literal: true

# Represents the game board
class Board
  attr_accessor :max_row, :max_column, :grid

  def initialize
    @max_row = 6
    @max_column = 7
    @grid = Array.new(@max_row) { Array.new(@max_column) { '*' } }
  end

  def display_grid
    board = []

    @grid.each do |row|
      board << row.join(' ')
    end

    board << '1 2 3 4 5 6 7'
    board = board.join("\n")
    puts board
  end

  def valid_cell?(column)
    row = empty_row(column)
    return false if row.nil?

    @grid[row][column] == '*'
  end

  def update_grid(column, color)
    row = empty_row(column)
    @grid[row][column] = color
  end

  def available_cell_left?
    @grid.each do |row|
      return true if row.include?('*')
    end
    false
  end

  private

  def empty_row(column)
    row = @max_row - 1
    while row >= 0
      return row if @grid[row][column] == '*'

      row -= 1
    end
    nil
  end
end
