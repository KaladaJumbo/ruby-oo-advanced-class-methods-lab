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
    
    new_int = self.new
    new_int.save
    return new_int

  end

  def self.new_by_name(name)

    new_int = self.new
    new_int.name = name
    return new_int

  end

  def self.create_by_name(name) #dont know why the test needs this 
                                #when we have Song#new_by_name
    new_int = self.create
    new_int.name = name
    return new_int

  end

  def self.find_by_name(name)

    found = Song.all.select do |song|

      song.name == name

    end

    return found[0]

  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name) == nil
      return self.create_by_name(name)
    else
      return self.find_by_name(name)
    end

  end

  def self.alphabetical

    #sorts by first name.. readme was not clear on what to sort by
    list = self.all.sort_by {|song| song.name} 
    return list

  end

  def self.new_from_filename(filename)

    filename_arr = filename.split(" - ")
    filename_arr[1].slice!(".mp3")
    new_int = self.new_by_name(filename_arr[1])
    new_int.artist_name = filename_arr[0]
    return new_int
  end

  def self.create_from_filename(filename)

    filename_arr = filename.split(" - ")
    filename_arr[1].slice!(".mp3")
    new_int = self.create_by_name(filename_arr[1])
    new_int.artist_name = filename_arr[0]
    return new_int
  end 

  def self.destroy_all

    self.all.clear

  end

end

