require_relative('../db/sql_runner')
require_relative('artist.rb')

class Album 

    attr_accessor :title, :genre, :artist_id
    attr_reader :id
    

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
        values = [@title, @genre, @artist_id, @id]
        SqlRunner.run(sql, values)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM albums WHERE id = $1"
        values = [id]
        results_array = SqlRunner.run(sql, values)
        return nil if results_array.first() == nil
        album_hash = results_array[0]
        found_album = Album.new(album_hash)
        return found_album
    end

    def get_artist_for_album()
        sql = "SELECT * FROM artists
        WHERE id = $1"
        values = [@artist_id]
        result = SqlRunner.run(sql, values)
        artist_found = result[0]
        correct_artist = Artist.new(artist_found)
        return correct_artist
    end

end