require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL ).first
      SELECT *
      FROM #{self.table_name}
      LIMIT 0
    SQL
    cols.map!(&:to_sym)
    @columns = cols
  end

  def self.finalize!
    self.columns.each do |col_name|
      define_method("#{col_name}") do
        attributes[col_name]
      end
    end

    self.columns.each do |col_name|
      define_method("#{col_name}=") do |value|
        attributes[col_name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.tableize
  end

  def self.all
    all = DBConnection.execute2(<<-SQL ).drop(1)
      SELECT #{self.table_name}.*
      FROM #{self.table_name}
    SQL
    self.parse_all(all)
  end

  def self.parse_all(results)
    results.map do |attrs|
      self.new(attrs)
    end
  end

  def self.find(id)
    found = DBConnection.execute(<<-SQL, id)
      SELECT #{self.table_name}.*
      FROM #{self.table_name}
      WHERE #{self.table_name}.id = ?
    SQL
    return nil unless found
    parse_all(found).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      name = attr_name.to_sym
      if self.class.columns.include?(name)
        self.send("#{name}=", value)
      else
        raise "unknown attribute '#{name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |attr| self.send(attr) }
  end

  def insert
    cols = self.class.columns.drop(1)
    names = cols.map(&:to_s).join(', ')
    question_marks = (['?'] * cols.size).join(', ')
    results = DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO #{self.class.table_name} (#{names})
      VALUES (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    cols = self.class.columns
    attr_vals = cols.map { |attr| "#{attr} = ?" }.join(', ')
    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE #{self.class.table_name}
      SET #{attr_vals}
      WHERE #{self.class.table_name}.id = ?
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def save
    id.nil? ? insert : update
  end
end
