# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  SELECT
    countries.name
  FROM
    countries
  WHERE
    countries.gdp >
    (SELECT
      gdp
    FROM
      countries
    WHERE
      continent LIKE 'Europe' AND gdp IS NOT NULL
    ORDER BY
      gdp DESC
    LIMIT
     1
    )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT countries.continent,
         countries.name,
         countries.area
    FROM
      countries
    WHERE
      countries.area =
      (SELECT
        MAX(countries1.area)
      FROM
        countries as countries1
      WHERE
        countries.continent = countries1.continent
    )
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    SELECT
      countries.name, countries.continent
    FROM
      countries
    WHERE
      countries.population > 3 * (
        SELECT
          MAX(countries1.population)
        FROM
          countries as countries1
        WHERE
          countries1.name != countries.name AND countries1.continent = countries.continent
      )

  SQL
end
