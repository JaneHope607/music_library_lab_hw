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

    def Album.delete_all()
        sql = "DELETE FROM albums"
        result = SqlRunner.run(sql)
    end

    def delete()
    end

end