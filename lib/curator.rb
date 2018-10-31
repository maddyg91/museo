require './lib/photograph'
require './lib/artist'
require 'pry'

class Curator
  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find_all do |artist|
      artist.id == id
      end
  end

  def find_photograph_by_id(id)
    @photographs.find_all do |photograph|
      photograph.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photograph|
      photograph.artist_id == artist
    end
  end

end
#
# pry(main)> diane_arbus = curator.find_artist_by_id("3")
# #=> #<Artist:0x00007fa3c13eef88 @born="1923", @country="United States", @died="1971", @id="3", @name="Diane Arbus">
#
# pry(main)> curator.find_photographs_by_artist(diane_arbus)
# #=> [#<Photograph:0x00007fa3c13a4050...>, #<Photograph:0x00007fa3c110e4a8...>]
#
# pry(main)> curator.artists_with_multiple_photographs
# #=> [#<Artist:0x00007fa3c13eef88 @born="1923", @country="United States", @died="1971", @id="3", @name="Diane Arbus">]
#
# pry(main)> curator.artists_with_multiple_photographs.length
# #=> 1
#
# pry(main)> diane_arbus == curator.artists_with_multiple_photographs.first
# #=> true
#
# pry(main)> curator.photographs_taken_by_artists_from("United States")
# #=> [#<Photograph:0x00007fa3c286b088...>, #<Photograph:0x00007fa3c13a4050...>, #<Photograph:0x00007fa3c110e4a8...>]
#
# pry(main)> curator.photographs_taken_by_artists_from("Argentina")
# #=> []
