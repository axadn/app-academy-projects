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
    class_name.to_s.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, opts = {})
    self.foreign_key =  (opts[:foreign_key] || "#{name}_id".to_sym)
    self.primary_key = (opts[:primary_key] || :id)
    self.class_name = (opts[:class_name] || name.capitalize).to_s
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, opts = {})
    self.foreign_key =  (opts[:foreign_key] || "#{ self_class_name.downcase}_id".to_sym )
    self.primary_key = (opts[:primary_key] || :id)
    self.class_name = (opts[:class_name] || name.capitalize[0...-1]).to_s
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) do
      options.model_class.where(options.primary_key => send(options.foreign_key)).first
    end
    assoc_options[name] = options
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.to_s, options)
    define_method(name) do
      options.model_class.where(options.foreign_key => send(options.primary_key))
    end
  end

  def assoc_options
    @assoc_options ||= {}
  end
end

class SQLObject
  extend Associatable
end
