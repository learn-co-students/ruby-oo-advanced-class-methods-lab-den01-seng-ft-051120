class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = Song.new
    self.all << new_song
    new_song
  end
  
  def save
    self.class.all << self
  end

  def self.new_by_name name
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name name
    new_song = Song.new
    new_song.name = name
    self.all << new_song
    new_song
  end

  def self.find_by_name name
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name name
    if self.find_by_name name
      return self.find_by_name name
    else
      self.create_by_name name
    end
  end

  def self.alphabetical
    self.all.sort { |song1, song2| song1.name <=> song2.name }
  end
  
  def self.new_from_filename filename
    song_info = filename.gsub(".mp3", "").split(" - ")
    artist = song_info[0]
    song_title = song_info[1]
    new_song = Song.new_by_name song_title
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename filename
    song_info = filename.gsub(".mp3", "").split(" - ")
    artist = song_info[0]
    song_title = song_info[1]
    new_song = Song.create_by_name song_title
    new_song.artist_name = artist
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
