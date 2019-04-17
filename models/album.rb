require('PG')

class Album

  attr_reader :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    db = PG.connect({dbname: 'music_collection', host: 'localhost'})
    sql = "INSERT INTO albums
    (
      title,
      genre,
      artist_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @genre, @artist_id]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    db.close()
    @id = result[0]['id'].to_i
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run( sql )
    return albums.map { |album| Album.new( album ) }
  end







end
