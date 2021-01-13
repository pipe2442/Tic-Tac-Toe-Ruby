def combinations
  [
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

def winner_message
  if @turn.odd?
    puts "Congrats #{@first_player} you are the winner"
  else
    puts "Congrats #{@second_player} you are the winner"
  end
end

def win_validator(_board, _firstp, _secondp, comb)
  comb.find do |ind|
    values = @board.values_at(*ind)
    next unless values.all?('X') || values.all?('O')
      
    create_board
    @winner = true
    winner_message
    @game_on = false
  end
end

def valid_moves(player_sel, _board)
  if (player_sel < 1) || (player_sel > 9)
    puts 'THATS NOT A VALID MOVE!'
    @valid_move = false
    @turn -= 1
  elsif (@board[player_sel - 1] == 'X') || (@board[player_sel - 1] == 'O')
    puts 'THAT SPOT IS ALREADY TAKEN'
    @turn -= 1
    @valid_move = false
  end
end

def game_selector(player, player_sel, selection)
  if (player == @first_player) && @valid_move
    @board[player_sel - 1] = selection
  elsif (player == @second_player) && @valid_move
    @board[player_sel - 1] = selection
  end
end

def draw_case
  puts 'SORRY, ITS A DRAW NO WINNER' if @turn == 9 && @winner == false
  create_board
  return @game_on = false if @turn == 9 && @winner == false
end
