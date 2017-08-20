require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    self.class_name.downcase + 's'
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    info = {
      foreign_key: "#{name}_id".to_sym,
      class_name: name.to_s.camelcase,
      primary_key: :id
    }

    info.keys.each do |key|
      if options[key]
        self.send("#{key}=", options[key])
      else
         self.send("#{key}=", info[key])
      end
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    info = {
      foreign_key: "#{self_class_name}_id".downcase.to_sym,
      class_name: name.to_s.singularize.capitalize,
      primary_key: :id
    }

    info.keys.each do |key|
      if options[key]
        self.send("#{key}=", options[key])
      else
         self.send("#{key}=", info[key])
      end
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) do
      foreign_key = self.send(options.foreign_key)
      options.model_class.where(options.primary_key => foreign_key).first
    end
  end

require "byebug"
  def has_many(name, options = {})
    options = HasManyOptions.new(name, options)
    
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
