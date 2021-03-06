class TicTacToe

    def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
    end

    WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
    ]
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i-1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count{ |turn | turn != " " }
    end

    def current_player
        # if turn.count.even?
        #    "X"
        # else
        #    "O"
        # end
        turn_count.even? ? "X": "O"
    end

    def turn
        puts "Please select a square (1-9):"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            puts "Please select a valid answer (1-9)"
            turn
        end
        display_board
    end

    # def won?
    #     WIN_COMBINATIONS.any? | winning |
    #     if position_taken?(winning[0]) && @board[winning[0]] == @board[winning[1]]
    #         && @board[winning[1]] == @board[winning[2]]
    #         true
    #     else
    #         false
    #     end
    #     winning
    # end

    def won?

        i = 0
        8.times do
          if @board[WIN_COMBINATIONS[i][0]] == 'X' && @board[WIN_COMBINATIONS[i][1]] == 'X' && @board[WIN_COMBINATIONS[i][2]] == 'X'
            return WIN_COMBINATIONS[i]
          elsif @board[WIN_COMBINATIONS[i][0]] == 'O' && @board[WIN_COMBINATIONS[i][1]] == 'O' && @board[WIN_COMBINATIONS[i][2]] == 'O'
            return WIN_COMBINATIONS[i]
          end
          i += 1
        end
        return false
      end
    

    def full?
        @board.none? { |space| space == " "}
    end

#     def draw?
#         if @board.full? && !won?
#             true
#         else
#             false
#         end 
#     end

#     def over?
#         won? || draw?
#     end

#     def winner

#     end
# end

def draw?
    if won? == false && full? == true
      return true
    else
      return false
    end
  end

  def over?
    if draw? == true
      return true
    elsif won? != false
      return true
    elsif full? == false
      return false
    end
  end

  def winner
    if won? != false
      arr = won?
      if @board[arr[0]] == 'X'
        return 'X'
      else
        return 'O'
      end
  elsif full? == false || draw? == false
    return nil
  end
  end

  def turn
    puts "Choose a position between 1-9"
    current = ""
    input = gets.strip
    index = input_to_index(input)
    current = current_player
    if valid_move?(index) == true
      move(index, current)
      display_board()
    else
      puts "Invalid move, try again"
      turn()
    end
  end

  def play
    while over? != true
      turn
    end

    if won? != false
      winningPlayer = winner
      puts "Congratulations #{winningPlayer}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end


