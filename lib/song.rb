class Song
  attr_accessor :name, :artist_name, :file_type
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name song_name
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name song_name
    song = self.new_by_name song_name
  end

  def self.find_by_name song_name
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name song_name
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename file_name
    file_data = file_name.split(/\-|\./).map {|string| string.strip}
    artist = file_data[0]
    song_name = file_data[1] 
    file_data_type = file_data[2]

    song = self.create_by_name song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename file_name
    self.new_from_filename file_name
  end

  def self.destroy_all
    @@all = []
  end
end
