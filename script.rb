def print_board(board)
    print "#{board[0]} | #{board[1]} | #{board[2]} \n"
    print "----------\n"
    print "#{board[3]} | #{board[4]} | #{board[5]} \n"
    print "----------\n"
    print "#{board[6]} | #{board[7]} | #{board[8]} \n\n"
    
end

def check_winner(board)
    case true
        #Horizontal
    when board[0] == board[1] && board[0] == board[2] && board[0]!=" "
        return board[0]
    when board[3] == board[4] && board[3] == board[5] && board[3]!=" "
        return board [3]
    when board[6] == board[7] && board[6] == board[8] && board[6]!=" "
        return board [6]
        #Vertical
    when board[0] == board[3] && board[0] == board[6] && board[0]!=" "
        return board[0]
    when board[1] == board[4] && board[1] == board[7] && board[1]!=" "
        return board [3]
    when board[2] == board[5] && board[2] == board[8] && board[2]!=" "
        return board [6]
        #Diaogonal
    when board[0] == board[4] && board[0] == board[8] && board[0]!=" "
        return board [6]
    when board[2] == board[4] && board[2] == board[6] && board[2]!=" "
        return board [6]
    else
       return nil 
    end
    
end


def play_turn(mark, board)
    print ("Where do you want to place #{mark} (Enter 1[Top Left] to 9[Top Right]): ")
    ans = gets().chomp.to_i
    while (ans <=0 || ans>9) || board[ans-1]!=" "
        puts "You entered location already marked" unless board[ans-1]==" "
        puts "You entered wrong please Input 1 to 9" if ans <=0 || ans>9
        print ("Where do you want to place #{mark} : ") 
        ans = gets().chomp.to_i
    end
    board[ans-1] = mark
    print_board(board)
    res =  check_winner(board)
    return res
end



def start_game
    board = Array.new(9," ")
    game_running = true
    current_turn = "X"
    while game_running
        res = play_turn(current_turn, board)
        current_turn =="X"? current_turn = "O": current_turn = "X"
        if res
            p "#{res} Won!"
            break
        end
    end
end

start_game
