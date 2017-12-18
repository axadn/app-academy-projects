require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
class SQLObject

  def self.columns
    @colums ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    .first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |col_name|
      define_method(col_name){ attributes[col_name]}
      define_method("#{col_name}=") {|val| attributes[col_name] = val}
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    parse_all(DBConnection.instance.execute("SELECT * FROM #{table_name}"))
  end

  def self.parse_all(results)
    results.map{|col| new(col)}
  end

  def self.find(id)
    result = DBConnection.execute("SELECT * FROM #{table_name} WHERE id = #{id}").first
    return result if result.nil?
    new(result)
  end

  def initialize(params = {})
    params.each do |attr_name, val|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name.to_sym)
      send("#{attr_name}=", val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    attributes.values
  end

  def attributes_without_id
    attrs = attributes.dup
    attrs.delete(:id)
    attrs
  end

  def insert
    col_names = ""
    attrs = attributes_without_id
    attrs.keys.each do |key|
      col_names << key.to_s << ","
    end
    col_names.chomp!(',')
    question_marks = ("?, " * (attrs.length)).chomp(", ")
    DBConnection.instance.execute(<<-SQL,*attrs.values)
      INSERT into
        #{self.class.table_name} (#{col_names})
      values
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    attrs = attributes_without_id
    col_names = attrs.keys.map do |key|
        "#{key.to_s} = ?"
    end.join(", ")

    DBConnection.instance.execute(<<-SQL,*attrs.values, self.id )
      update
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE
        id = ?
    SQL
  end

  def save
    if id.nil?
      insert
    else
      update
    end
  end
end
