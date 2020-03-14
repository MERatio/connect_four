# frozen_string_literal: true

require_relative './board.rb'
require_relative './player.rb'

# Reprsents the game overall functionality
class Game
  attr_accessor :board, :current_player, :winner, :draw
  attr_reader :player1, :player2

  def initialize
    @board = Board.new
    @player1 = Player.new('Player1', '○')
    @player2 = Player.new('Player2', '●')
    @current_player = @player1
    @winner = nil
    @draw = nil
  end

  def play
    until @winner || @draw
      @board.display_grid
      puts
      pick_column
      puts
      check_win
      check_draw unless @winner
      change_player unless @winner
    end
    display_winner
  end

  private

  def pick_column
    column = nil
    until valid_column?(column) && @board.valid_cell?(column - 1)
      puts "#{current_player.name} (#{current_player.color}) choose you column"
      column = gets.strip.to_i
    end
    @board.update_grid(column - 1, @current_player.color)
  end

  def change_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def valid_column?(column)
    (1..7).include?(column)
  end

  def check_draw
    @draw = true unless @board.available_cell_left?
  end

  def check_win
    # All checks are from top to bottom, left to right
    if check_horizontal == true || check_vertical == true || check_diagonal == true
      @winner = @current_player
    end
  end

  def check_horizontal
    @board.grid.each do |row|
      count = 0
      row.each do |cell|
        cell == @current_player.color ? count += 1 : count = 0
        return true if count >= 4
      end
    end
  end

  def check_vertical
    @board.max_column.times do |column|
      count = 0
      @board.max_row.times do |row|
        cell = @board.grid[row][column]
        cell == @current_player.color ? count += 1 : count = 0
        return true if count >= 4
      end
    end
  end

  def check_diagonal
    # I decrease the checking of row and columns, because its not enough to create a same four consecutive color
    check_baskslash_diagonal == true || check_forward_slash_diagonal == true
  end

  def check_baskslash_diagonal
    (0...@board.max_row - 3).each do |row|
      (0...@board.grid[row].length - 3).each do |column|
        cell = @board.grid[row][column]
        if cell == @current_player.color &&
           cell == @board.grid[row + 1][column + 1] &&
           cell == @board.grid[row + 2][column + 2] &&
           cell == @board.grid[row + 3][column + 3]
          return true
        end
      end
    end
  end

  def check_forward_slash_diagonal
    (0...@board.max_row - 3).each do |row|
      (3...@board.grid[row].length).each do |column|
        cell = @board.grid[row][column]
        if cell == @current_player.color &&
           cell == @board.grid[row + 1][column - 1] &&
           cell == @board.grid[row + 2][column - 2] &&
           cell == @board.grid[row + 3][column - 3]
          return true
        end
      end
    end
  end

  def display_winner
    @board.display_grid
    puts
    puts "#{winner.name} (#{winner.color}) Wins!"
  end
end
