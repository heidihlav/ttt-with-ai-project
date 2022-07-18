class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end


  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def current_player
    if @board.turn_count.even?
        player_1
    else @board.turn_count.odd?
        player_2
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      board.cells[win_combo[0]] == board.cells[win_combo[1]] && board.cells[win_combo[1]] == board.cells[win_combo[2]] && board.taken?(win_combo[0] + 1)
    end
  end
    #full and the same letter in three consecutive inndices

  def draw?
    board.full? && !won?  
  end

  def over?
    draw? || won?
  end

  def winner
    if win_combo = won?
      board.cells[win_combo[1]]
    end 
  end

  def turn
    player = current_player
    player_move = player.move(@board)
      if !@board.valid_move?(player_move)
        turn
      else
        @board.turn_count+1
        @board.update(player_move, player)
        puts "The current move is not valid! Please try another position."
      end
  end

  def play
    turn until over?
    if draw?
      puts "Cat's Game!" 
    else over?
      puts "Congratulations #{winner}!"
    end
  end






end


    # binding.pry
