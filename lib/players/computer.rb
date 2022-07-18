module Players

    class Computer < Player

      def move(board)
       if board.position(1)
        return "1"
       end
      end

    end


end