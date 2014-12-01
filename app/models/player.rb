class Player
	ROWS 		= 4
	COLUMNS = 4

	attr_reader :player_grid

	def initialize
		@player_grid = Array.new(ROWS).fill(Array.new(COLUMNS))		
	end
end