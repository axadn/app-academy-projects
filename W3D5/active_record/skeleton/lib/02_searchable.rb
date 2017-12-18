require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'
module Searchable
  def where(opts)
    col_names = opts.keys.map do |key|
        "#{key.to_s} = ?"
    end.join(" AND ")
    DBConnection.instance.execute(<<-SQL,*opts.values)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{col_names}
    SQL
    .map {|col| new(col)}
  end
end

class SQLObject
  extend Searchable
end
