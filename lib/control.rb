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
