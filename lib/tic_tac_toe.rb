#!/usr/bin/env ruby

class TicTacToe

	#initialize board
	def initialize(board = nil)
		@board = board ||  (1..9).to_a
	end

	#Winning Combinations constant
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

	#Draws the board
	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
		puts 				"---|---|---"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
		puts 				"---|---|---"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
	end

	#change the user input to an index value	
	def input_to_index(input)
		input.to_i - 1
	end

	#put an element onto the board	
	def move(index, token = "X")
		@board[index] = token
		display_board
	end

	#checks if position is taken	
	def position_taken?(index)
		@board[index].is_a?(Integer) ? false : true
	end

	#checks if input is within range and the position is opn	
	def valid_move?(index)
		index < 9 && !position_taken?(index) ? true : false
	end

	#takes user input, validates, then makes move	
	def turn 
		puts "Enter a square to take:"
		index = gets.strip
		index = input_to_index(index)
		if valid_move?(index)
			move(index, current_player)
		else 
			puts "Invald space, try again" 
		end
	end
	
	#keeps track of number of turns
	def turn_count
		@board.count{|token| token == "X" || token == "O"}
	end

	#returns current player token
	def current_player
		turn_count % 2 == 0 ? "X" : "O"
	end

	#Checks if game has winner
	def won?
		WIN_COMBINATIONS.each do |condition| 
			if @board.values_at(*condition[0..2]).uniq.length == 1
				return condition[0..2]
			end
		end
		false
	end

	#Uses the default state of the board to test if the board the full 	
	def full? 
	@board.any? {|a| a.is_a?(Integer)} ? false : true
	end

	#Checks for draw
	def draw?
		full? && !won? ? true : false
	end
	
	#Checks if game is over	
	def over?
		draw? || won? ? true : false
	end

	#Checks & Displays winner	
	def winner
		puts @board[won?[0]] + " Won the Game!" 
	end
	
	#Plays the game until it is over
	def play
	
		until over?
		turn
		end
		
		if won?  
			winner
		elsif draw? 
			puts "The game was a Draw!"
		else 
			puts "Unexpected Error Occured" 
		end
	end
end


