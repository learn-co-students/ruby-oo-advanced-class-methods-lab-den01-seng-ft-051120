class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    all << song
    song
  end
  
  def self.new_by_name name
    song = self.new 
    song.name = name 
    song
  end
  
  def self.create_by_name name
    song = self.new
    song.name = name 
    all << song 
    song
  end
  
  def self.find_by_name name 
    all.find{|song_object| song_object.name == name}
  end
  
  def self.find_or_create_by_name name
    !find_by_name(name) ? create_by_name(name) : find_by_name(name)
  end
  
  def self.alphabetical 
    all.sort_by(&:name)
  end
  
  def self.new_from_filename file
    song = self.new
    song_split = file.split(' - ')
    song.name = song_split[1].chomp('.mp3')
    song.artist_name = song_split[0]
    song
  end
  
  def self.create_from_filename file
    song = self.new
    song_split = file.split(' - ')
    song.name = song_split[1].chomp('.mp3')
    song.artist_name = song_split[0]
    @@all << song
    song
  end
  
  def self.destroy_all
    @@all.clear
  end

end
