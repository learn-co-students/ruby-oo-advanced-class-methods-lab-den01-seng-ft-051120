require 'pry'

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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = new_by_name(song_name)
    song
  end

  def self.find_by_name(song_name)
    @@all.find { |song_info| song_info.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) != true then create_by_name(song_name) end
    find_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort { |song1, song2| song1.name <=> song2.name }
  end

  def self.new_from_filename(song_filename)
    song_file = song_filename.split(/ - |.mp3/)
    song_info = find_or_create_by_name(song_file.last)
    song_info.artist_name = song_file.first
    song_info
  end

  def self.create_from_filename(song_filename)
    new_from_filename(song_filename)
  end

  def self.destroy_all
    @@all.clear
  end
end
