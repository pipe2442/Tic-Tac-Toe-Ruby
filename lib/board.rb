class GameBoard
  def initialize(first_player, second_player)
    @board = %w[1 2 3 4 5 6 7 8 9]
    @game_on = true
    @turn = 0
    @first_player = first_player
    @second_player = second_player
    @xarr = []
    @oarr = []
  end

  def create_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def gameTurn
    winnersDatabase = [
      [0, 1, 2], [0, 2, 1], [2, 0, 1], [2, 1, 2], [1, 0, 2], [1, 2, 0],
      [3, 4, 5], [3, 5, 4], [4, 3, 5], [4, 5, 3], [5, 4, 3], [5, 3, 4],
      [6, 7, 8], [6, 8, 7], [7, 6, 8], [7, 8, 6], [8, 6, 7], [8, 7, 6],
      [0, 3, 6], [0, 6, 3], [3, 6, 0], [3, 0, 6], [6, 3, 0], [6, 0, 3],
      [1, 4, 7], [1, 7, 4], [4, 1, 7], [4, 7, 1], [7, 4, 1], [7, 1, 4],
      [2, 5, 8], [2, 8, 5], [5, 2, 8], [5, 8, 2], [8, 5, 2], [8, 2, 5],
      [0, 4, 8], [0, 8, 4], [4, 8, 0], [4, 0, 8], [8, 4, 0], [8, 0, 4],
      [2, 4, 6], [2, 6, 4], [6, 2, 4], [6, 4, 2], [4, 2, 6], [4, 6, 2]
    ]

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
        puts 'THATS NOT A VALID MOVE!!!'
        validMove = false
        @turn -= 1
      elsif (@board[player_sel - 1] == 'X') || (@board[player_sel - 1] == 'O')
        puts 'THAT SPOT IS ALREADY TAKEN'
      end

      @board[player_sel - 1] = selection
      @turn += 1

      if (player == @first_player) && validMove
        @xarr << (player_sel - 1)
      elsif (player == @second_player) && validMove
        @oarr << (player_sel - 1)
      elsif @xarr.length > 3
        @xarr.shift
      elsif @oarr.length > 3
        @oarr.shift
      end

      validMove = true

      if @board.all? { |i| (i == 'X') || (i == 'O') }
        puts ' '
        puts 'GAME FINISHED ITS A DRAW NO ONE WINS'
        puts ' '
        break
      end

      print @xarr
      puts ' '
      puts ' '
      print @oarr
      puts ' '
      puts ' '

      winnersDatabase.each do |i|
        if @xarr == i
          puts "CONGRATULATIONS THE 'X' PLAYER NAMED #{@first_player} WINS"
          puts ' '
          create_board
          @game_on = false
        elsif @oarr == i
          puts "CONGRATULATIONS THE 'O' PLAYER NAMED #{@second_player} WINS"
          puts ' '
          create_board
          @game_on = false
        end
      end

    end
  end
end
