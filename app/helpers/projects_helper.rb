module ProjectsHelper
	def drum_name(index)
		drum_names = ["CYMBAL","CABASA","CLAVE","COWBELL","OHAT","HAT","CLAP","SNARE","KICK"]
		puts index
		drum_names[index]
	end
end
