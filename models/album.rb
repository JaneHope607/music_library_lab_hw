require_relative('../db/sql_runner')

class Album 

    attr_accessor :id, :title, :genre, :artist_id

    def initialize(options)
        @id = options['id'] if options['id']
        @title = options['title']
        @genre = options['genre']
        @artist_id = options['artist_id'].to_i()
    end

    def save()
        sql = "INSERT INTO albums
        (title, genre, artist_id)
        VALUES
        ($1, $2, $3) RETURNING id"
        values = [@title, @genre, @artist_id]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i()
    end

    def Album.all()
        sql = "SELECT * FROM albums"
        album_list = SqlRunner.run(sql)
        return album_list.map { |album| Album.new(album)}
    end

    def Album.delete_all()
        sql = "DELETE FROM albums"
        result = SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM albums WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE albums
        SET (title, genre, artist_id)
        = ($1, $2, $3)
        WHERE id = $4"
        values = [@title, @genre, @artist_id]
        SqlRunner.run(sql, values)
    end

end