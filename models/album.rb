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
    @id = db.exec_prepared("save", values)[0]["id"]
    db.close()
  end

  def self.delete_all()
    db = PG.connect({dbname: 'music_collection', host: 'localhost'})
    sql = "DELETE FROM albums"
    db.prepare("delete_all", sql)
    result = db.exec_prepared("delete_all")
    db.close()
  end







end
