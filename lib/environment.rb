require 'pry'
require "./lib/song"


K_Perry1 = Song.create

K_Perry2 = Song.new_by_name "Teenage Dream"

T_Swift1 = Song.create_by_name "Blank Space"
T_Swift2 = Song.create_by_name "Style"


binding.pry