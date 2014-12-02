class Player
	SIZE 		= 8
	PAD_SIZE = 50
  
	attr_reader :player_grid, :pad_size

	def initialize
		@pad_size = "#{PAD_SIZE}x#{PAD_SIZE}"
		@player_grid = Array.new(SIZE).fill(Array.new(SIZE))
    fill_grid_with_indices
	end

  def fill_grid_with_indices
    index = 0 
    @player_grid = @player_grid.map { |row| row.map { |column| column = index; index += 1 } }
  end
end