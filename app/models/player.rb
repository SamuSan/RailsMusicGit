class Player
	DRUMS 	= 10
	TICKS 	= 16
	PAD_SIZE = 50

	attr_reader :player_grid, :pad_size

	def initialize
		@pad_size = "#{PAD_SIZE}x#{PAD_SIZE}"
		@player_grid = (0...DRUMS * TICKS).to_a.in_groups_of(TICKS)
	end
end