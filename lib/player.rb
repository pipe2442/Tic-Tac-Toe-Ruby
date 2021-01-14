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

def game_selector(player, player_sel, selection)
  if (player == @first_player) && @valid_move
    @board[player_sel - 1] = selection
  elsif (player == @second_player) && @valid_move
    @board[player_sel - 1] = selection
  end
end

def valid_moves(player_sel, _board)
  if (player_sel < 1) || (player_sel > 9)
    valid_message
    @valid_move = false
    @turn -= 1
  elsif (@board[player_sel - 1] == 'X') || (@board[player_sel - 1] == 'O')
    spot_taken_message
    @turn -= 1
    @valid_move = false
  end
end

def draw_case
  draw_message if @turn == 9 && @winner == false
  create_board
  return @game_on = false if @turn == 9 && @winner == false
end

def winner_message
  if @turn.odd?
    winfplayer_message
  else
    winsplayer_message
  end
end
