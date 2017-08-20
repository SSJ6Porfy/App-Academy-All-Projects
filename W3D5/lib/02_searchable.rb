require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    keys = params.keys.map { |key| "#{key} = ?" }.join(" AND ")
    values = params.values
    result = DBConnection.execute(<<-SQL, *values)
      SELECT *
      FROM #{table_name}
      WHERE #{keys}
    SQL
    parse_all(result)
  end
end

class SQLObject
  extend Searchable
end
