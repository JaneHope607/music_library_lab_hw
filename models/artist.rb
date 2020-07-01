require_relative('../db/sql_runner')


class Artist

    attr_reader :id, :first_name, :last_name

    def initialize(options)
        @id = options['id'] if options['id']
        @first_name = otions['first_name']
        @last_name = options['last_name']
    end


end