class GameBoard
  def initialize(first_player, second_player)
    @board = %w[1 2 3 4 5 6 7 8 9]
    @game_on = true
    @turn = 0
    @first_player = first_player
    @second_player = second_player
    @winner = false
    @WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]
  end

  def create_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def gameTurn
    while @game_on
      player = @first_player
      selection = 'X'
      validMove = true

      if @turn.odd?
        player = @second_player
        selection = 'O'
      end

      puts "Its #{player} turn"
      puts 'Please select an available move based on the board numbers:'
      puts ' '
      create_board
      player_sel = gets.chomp.to_i

      if (player_sel < 1) || (player_sel > 9)
        puts 'THATS NOT A VALID MOVE!'
        validMove = false
        @turn -= 1
      elsif (@board[player_sel - 1] == 'X') || (@board[player_sel - 1] == 'O')
        puts 'THAT SPOT IS ALREADY TAKEN'
        @turn -= 1
        validMove = false
      end

      @turn += 1

      if (player == @first_player) && validMove
        @board[player_sel - 1] = selection
      elsif (player == @second_player) && validMove
        @board[player_sel - 1] = selection
      end

      validMove = true

      @WIN_COMBINATIONS.find do |indices|
        values = @board.values_at(*indices)
        if values.all?('X')
          puts "CONGRATULATIONS THE 'X' PLAYER NAMED #{@first_player} WINS"
          puts ' '
          create_board
          @winner = true
          @game_on = false
        elsif values.all?('O')
          puts "CONGRATULATIONS THE 'O' PLAYER NAMED #{@second_player} WINS"
          puts ' '
          create_board
          @winner = true
          @game_on = false
        end
      end

      next unless @turn == 9 && @winner == false
      puts ' '
      puts 'GAME FINISHED ITS A DRAW NO ONE WINS'
      puts ' '
      @game_on = false

    end
  end
end
