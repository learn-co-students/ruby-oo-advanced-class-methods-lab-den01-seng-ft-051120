require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize
    @name = name
    @artist_name = artist_name
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name name_of_song
    new_song = self.new
    new_song.name = name_of_song
    new_song.save
    new_song
  end
  
  def self.create_by_name name_of_song
    new_song = self.new
    new_song.name = name_of_song
    new_song.save
    new_song
  end

  def self.find_by_name name_of_song
    @@all.find do |songs|
      songs.name == name_of_song
    end
    
  end
  
  def self.find_or_create_by_name song_name
    if !Song.find_by_name(song_name)
      Song.create_by_name(song_name)
    else
      Song.find_by_name(song_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end

  def self.new_from_filename file
    all_info = file.split(" - ")
    song_artist = all_info[0]
    song_title = all_info[1]
    song_title = song_title.split(".")
    song_title_without_filename = song_title[0]

    new_song = Song.new
    new_song.name = song_title_without_filename
    new_song.artist_name = song_artist

    @@all << new_song

    new_song
    
  end
  
  def self.create_from_filename file
    all_info = file.split(" - ")
    song_artist = all_info[0]
    song_title = all_info[1]
    song_title = song_title.split(".")
    song_title_without_filename = song_title[0]
  
    new_song = Song.new
    new_song.name = song_title_without_filename
    new_song.artist_name = song_artist
  
    @@all << new_song
  
    new_song
    
  end

  def self.destroy_all
    @@all.clear
  end
end
