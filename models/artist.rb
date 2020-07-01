require_relative('../db/sql_runner')

class Artist

    attr_reader :id, :name

    def initialize(options)
        @id = options['id'] if options['id']
        @name = options['name']
    end

    def save()
        sql = "INSERT INTO artists
        (name)
        VALUES ($1)
        RETURNING id"
        values = [@name]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i()
    end

    def Artist.all()
        sql = "SELECT * FROM artists"
        artists_list = SqlRunner.run(sql)
        return artists_list.map { |artist| Artist.new(artist)} 
    end

    def Artist.delete_all()
        sql = "DELETE FROM artists"
        result = SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM artists WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE artists
        SET (name)
        = ($1)
        WHERE id = $2"
        values = [@name]
        SqlRunner.run(sql, values)
    end

end