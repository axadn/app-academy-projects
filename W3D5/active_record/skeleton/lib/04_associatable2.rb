require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    define_method(name) do
      belongs_to_table = self.class.assoc_options[through_name].table_name
      belongs_to_foreign_key = self.class.assoc_options[through_name].foreign_key
      belongs_to_primary_key = self.class.assoc_options[through_name].primary_key
      source_opts = self.class.assoc_options[through_name].model_class.assoc_options[source_name]
      source_primary_key = source_opts.primary_key
      source_foreign_key = source_opts.foreign_key
      source_table = source_opts.model_class.table_name
      source_model = source_opts.model_class


      select_string = source_model.columns.map do |col_name|
        "#{source_table}.#{col_name}"
      end.join(", ")

      source_model.parse_all(DBConnection.instance.execute(<<-SQL)
        SELECT
          #{select_string}
        FROM
          #{self.class.table_name}
        JOIN
          #{belongs_to_table}
        ON
          #{self.class.table_name}.#{belongs_to_foreign_key} = #{belongs_to_table}.#{belongs_to_primary_key}
        JOIN
          #{source_table}
        ON
         #{belongs_to_table}.#{source_foreign_key} = #{source_table}.#{source_primary_key}
        where
          #{self.class.table_name}.#{belongs_to_primary_key} = #{self.id}
      SQL
      ).first
    end
  end
end
