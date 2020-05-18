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
    instance = self.new
    self.all << instance 
    instance  
  end 

  def self.new_by_name song_name 
    new_song = self.create 
    new_song.name = song_name
    new_song
  end 

  def self.create_by_name song_name
    new_song = self.create 
    new_song.name = song_name
    new_song
  end 

  def self.find_by_name song_name
    self.all.find {|song| song.name == song_name}
  end 

  def self.find_or_create_by_name song_name
    if self.find_by_name song_name
      self.find_by_name song_name
    else 
      self.create_by_name song_name
    end 
  end 

  def self.alphabetical
    self.all.sort_by!{|song| song.name }
  end 

  def self.new_from_filename file_name
    song_parts = file_name.split(" - ")
    name_part = song_parts[1].delete_suffix(".mp3")
    new_song = self.find_or_create_by_name name_part
    new_song.artist_name = song_parts[0]
    new_song 
  end 

  def self.create_from_filename file_name
    self.new_from_filename file_name
  end
  
  def self.destroy_all
    self.all.clear
  end 

end
