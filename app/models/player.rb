class Player
	SIZE 		= 8
	PAD_SIZE = 50
	attr_reader :player_grid, :pad_size

	def initialize
		@pad_size = "#{PAD_SIZE}x#{PAD_SIZE}"
		@player_grid = Array.new(SIZE).fill(Array.new(SIZE))		
	end
end