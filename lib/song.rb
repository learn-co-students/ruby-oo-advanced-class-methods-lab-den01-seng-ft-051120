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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name song_name
    new_song = self.new
    new_song.name= song_name
    new_song
  end

  def self.create_by_name song_name
    new_song = self.create
    new_song.name= song_name
    new_song
  end

  def self.find_by_name song_name
    @@all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name song_name
    if self.find_by_name song_name
      self.find_by_name song_name
    else
      self.create_by_name song_name
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename song_filename
    artist_name = song_filename.split(" - ").first
    song_name = song_filename.split(" - ").last.split(".").first
    new_song = self.new
    new_song.name= song_name
    new_song.artist_name= artist_name
    new_song
  end

  def self.create_from_filename song_filename
    new_song = self.new_from_filename song_filename
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end