require('PG')
require_relative('album.rb')
require_relative('../db/sql_runner.rb')


class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values )
    albums = results.map { |album| Album.new( album ) }
    return albums
  end


  def save()
    sql = "INSERT INTO artists
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    @id = SqlRunner.run( sql, values )[0]["id"]
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end


  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run( sql )
    return artists.map { |artist| Artist.new( artist ) }
  end


  def self.find(id)
   sql = "SELECT * FROM artists WHERE id = $1;"
   values = [id]
   result = SqlRunner.run( sql, values )
   artist = result.map { |artist| Artist.new( artist ) }
   return artist
 end




end
