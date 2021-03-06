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

  def game_turn
    while @game_on
      system 'clear'
      valid_message if @valid_move == false
      @valid_move = true
      player = @first_player
      selection = 'X'
      if @turn.odd?
        player = @second_player
        selection = 'O'
      end
      move_selector_case
      create_board
      player_sel = chomping
      valid_moves(player_sel, @board)
      @turn += 1
      game_selector(player, player_sel, selection)
      win_validator(@board, @first_player, @second_player, combinations)
      draw_case
    end
  end
end
