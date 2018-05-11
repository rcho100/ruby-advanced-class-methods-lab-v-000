require "pry"
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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)

    song = self.new
    song.name = name
    #binding.pry
    song.save
    self.all
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
binding.pry
    my_song = self.create_by_name(filename.split(" - ")[1].chomp(".mp3"))
    my_song.artist_name = filename.split(" - ")[0]
    my_song
  end

  def self.create_from_filename

  end

end
