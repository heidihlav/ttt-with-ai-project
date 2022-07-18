class Board

    attr_accessor :cells

    def initialize
    #   @cells = cells
      reset!
    end

    def reset!
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(user_input)
      input = (user_input.to_i) - 1
      cells[input]
    end


    def full?
      cells.all? {|cell| cell == "X" || cell == "O"}
    end

    def turn_count
      cells.count {|cell| cell == "X" || cell == "O" }
    end

    def taken?(cells)
      !(position(cells) == "" || position(cells) == " " || position(cells) == nil)      # !(position(cells) == "" || position(cells) == " ")
    end

    def valid_move?(cells)
      cells.to_i.between?(1, 9) && !taken?(cells)
    end

    def update(token, player)
      cells[token.to_i - 1] = player.token
    end


#token is a string number needs to be to_i
#cells array of " " 9 of them
end