require_relative '../lib/control.rb'
# Class created to control game flow
class GameBoard
  def initialize(first_player, second_player)
    @board = %w[1 2 3 4 5 6 7 8 9]
    @game_on = true
    @turn = 0
    @first_player = first_player
    @second_player = second_player
    @winner = false
    @valid_move = true
  end

  def create_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def game_turn
    while @game_on
      player = @first_player
      selection = 'X'
      if @turn.odd?
        player = @second_player
        selection = 'O'
      end
      puts "#{player} please select a move based on the board numbers:"
      puts ' '
      create_board
      player_sel = gets.chomp.to_i
      valid_moves(player_sel, @board)
      @turn += 1
      game_selector(player, player_sel, selection)
      @valid_move = true
      win_validator(@board, @first_player, @second_player, combinations)
      draw_case
    end
  end
end

