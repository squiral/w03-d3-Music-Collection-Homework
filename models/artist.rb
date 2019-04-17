require('PG')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    db = PG.connect({dbname: 'music_collection', host: 'localhost'})
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
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"]
    db.close()
  end

  def delete()
    db = PG.connect({dbname: 'music_collection', host: 'localhost'})
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def self.delete_all()
    db = PG.connect({dbname: 'music_collection', host: 'localhost'})
    sql = "DELETE FROM artists"
    db.prepare("delete_all", sql)
    result = db.exec_prepared("delete_all")
    db.close()
  end




end
