#!/usr/bin/env ruby

class TicTacToe

	def initialize(board = nil)
		@board = board ||  (1..9).to_a
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

	

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
		puts 				"---|---|---"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
		puts 				"---|---|---"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
	end

	def current_player
		turn_count % 2 == 0 ? "X" : "O"
	end

	def turn_count
		@board.count{|token| token == "X" || token == "O"}
	end



end

new_game = TicTacToe.new

new_game.display_board
