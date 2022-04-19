module AskPlayer
    def ask_name
        puts "Hello, whats your name?"
        @name = gets.chomp
    end  
    
    def ask_piece(player)
        puts "#{player} would you like X or O?"
        piece = gets.chomp
        if piece == "X" || piece == "O"
            @piece = piece
        else 
            puts "NOT X OR O"
            ask_piece(player)
        end 
    end     

    def choose_number
        puts "Where would you like to go?"
        place = gets.chomp.to_i
        if place > 9 || place < 0 
            puts "INVALID SPOT"
            choose_number
        else 
            return place
        end 
    end     
end 

module GameFunctions
    def play_game(number, board, player_piece)
        if number == 1
            board.update_board(0,0, player_piece)    
        elsif number == 2
            board.update_board(0,1, player_piece)
        elsif number == 3
            board.update_board(0,2, player_piece)
        elsif number == 4
            board.update_board(1,0, player_piece)
        elsif number == 5
            board.update_board(1,1, player_piece)
        elsif number == 6
            board.update_board(1,2, player_piece)
        elsif number == 7
            board.update_board(2,0, player_piece)
        elsif number == 8
            board.update_board(2,1, player_piece)
        else
            board.update_board(2,2, player_piece)
        end 
    end 
end 

class Player
    include AskPlayer
    
    attr_accessor :name, :piece

    def initialize(name, piece)
        @name = name
        @piece = piece
    end 
end 

class Board
    include GameFunctions

    attr_accessor :board

    def showboard
        @board
    end 

    def initialize
        @board = Array.new(3) {Array.new(3, 0)}
    end 

    def array_values
        @board[0][0] = 1
        @board[0][1] = 2
        @board[0][2] = 3
        @board[1][0] = 4
        @board[1][1] = 5
        @board[1][2] = 6
        @board[2][0] = 7
        @board[2][1] = 8
        @board[2][2] = 9
    end 

    def drawboard
        @board.each do |row|
            print "| "
            row.each do |value|
                print "#{value} | "
            end 
            puts "\n------------"
        end 
    end 
    
    def update_board(index_one, index_two, new_value)
        if @board[index_one][index_two] != "X" && @board[index_one][index_two] != "O"
            @board[index_one][index_two] = new_value
        else
            puts "INVALID SPACE, TRY AGAIN"
            value = gets.chomp
        end 
        drawboard
    end 
 
    def return_value(index_one, index_two)
        @board[index_one][index_two]
    end 
end 


board = Board.new
board.array_values
board.drawboard

player_one = Player.new("","")
player_two = Player.new("","")
player_one.ask_name
player_two.ask_name

player_one.ask_piece(player_one.name)
player_two.ask_piece(player_two.name)

loop do 
    if player_two.piece == player_one.piece
        puts "Sorry, that symbol is unavailable"
        player_two.ask_piece(player_two.name)
    else 
        break
    end 
end 

loop do
    board.play_game(player_one.choose_number, board, player_one.piece)
    if board.return_value(0,0) == player_one.piece && board.return_value(1,0) == player_one.piece && board.return_value(2,0) == player_one.piece
        puts "#{player_one.name} wins!"
        break
    elsif board.return_value(0,1) == player_one.piece && board.return_value(1,1) == player_one.piece && board.return_value(2,1) == player_one.piece
        puts "#{player_one.name} wins!"
        break
    elsif board.return_value(0,2) == player_one.piece && board.return_value(1,2) == player_one.piece && board.return_value(2,2) == player_one.piece
        puts "#{player_one.name} wins!"
        break
    elsif board.return_value(0,0) == player_one.piece && board.return_value(0,1) == player_one.piece && board.return_value(0,2) == player_one.piece
        puts "#{player_one.name} wins!"
        break
    elsif board.return_value(1,0) == player_one.piece && board.return_value(1,1) == player_one.piece && board.return_value(1,2) == player_one.piece
        puts "#{player_one.name} wins!"
        break
    elsif board.return_value(2,0) == player_one.piece && board.return_value(2,1) == player_one.piece && board.return_value(2,2) == player_one.piece
        puts "#{player_one.name} wins!"
        break
    elsif board.return_value(0,0) == player_one.piece && board.return_value(1,1) == player_one.piece && board.return_value(2,2) == player_one.piece
        puts "#{player_one.name} wins!"
        break
    elsif board.return_value(0,2) == player_one.piece && board.return_value(1,1) == player_one.piece && board.return_value(1,2) == player_one.piece
        puts "#{player_one.name} wins!"
        break
    end 
    board.play_game(player_two.choose_number, board, player_two.piece)
    if board.return_value(0,0) == player_two.piece && board.return_value(1,0) == player_two.piece && board.return_value(2,0) == player_two.piece
        puts "#{player_two.name} wins!"
        break
    elsif board.return_value(0,1) == player_two.piece && board.return_value(1,1) == player_two.piece && board.return_value(2,1) == player_two.piece
        puts "#{player_two.name} wins!"
        break
    elsif board.return_value(0,2) == player_two.piece && board.return_value(1,2) == player_two.piece && board.return_value(2,2) == player_two.piece
        puts "#{player_two.name} wins!"
        break
    elsif board.return_value(0,0) == player_two.piece && board.return_value(0,1) == player_two.piece && board.return_value(0,2) == player_two.piece
        puts "#{player_two.name} wins!"
        break
    elsif board.return_value(1,0) == player_two.piece && board.return_value(1,1) == player_two.piece && board.return_value(1,2) == player_two.piece
        puts "#{player_two.name} wins!"
        break
    elsif board.return_value(2,0) == player_two.piece && board.return_value(2,1) == player_two.piece && board.return_value(2,2) == player_two.piece
        puts "#{player_two.name} wins!"
        break
    elsif board.return_value(0,0) == player_two.piece && board.return_value(1,1) == player_two.piece && board.return_value(2,2) == player_two.piece
        puts "#{player_two.name} wins!"
        break
    elsif board.return_value(0,2) == player_two.piece && board.return_value(1,1) == player_two.piece && board.return_value(1,2) == player_two.piece
        puts "#{player_two.name} wins!"
        break
    end 
end 

