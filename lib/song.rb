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
    song.save
    song
  end


  def self.new_by_name song_name
    new_song = self.new
    new_song.name = song_name
    new_song
  end


  def self.create_by_name create_song_name
    create_song = self.new
    create_song.name = create_song_name
    create_song.save
    create_song
  end


  def self.find_by_name song_name
    self.all.find { |song_item| song_item.name == song_name}
  end


  def self.find_or_create_by_name song_name
    if self.find_by_name song_name
      p self.find_by_name song_name
    else
      self.create_by_name song_name
    end
  end


    def self.alphabetical
      self.all.sort_by { |song_item| song_item.name}
    end


    def self.new_from_filename(file_name)
      mp3 = self.new 
      mp3.name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[1] 
      mp3.artist_name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[0]
      p mp3
    end


    def self.create_from_filename(file_name)
      mp_3 = self.new
      mp_3.name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[1] 
      mp_3.artist_name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[0]
      mp_3.save 
    end


    def self.destroy_all
      self.all.clear
    end

end
