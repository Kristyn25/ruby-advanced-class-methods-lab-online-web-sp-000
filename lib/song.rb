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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    result = self.all.detect {|song| song.name == title}
    result
  end

  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result
      return result
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    alphabetized = self.all.sort_by {|song| song.name}
    alphabetized
  end

  def self.new_from_filename(mp3_data)
    rows =mp3_data.split("\n")
    song = rows.collect do |row|
      data = row.split(", ")
      artist = data[0]
      name = data[1]

      song = self.new_by_name
      song.name = title
      song.artist = artist
      song
    end
    song
  end
end
