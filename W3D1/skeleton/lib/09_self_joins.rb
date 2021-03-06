# == Schema Information
#
# Table name: stops
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: routes
#
#  num         :string       not null, primary key
#  company     :string       not null, primary key
#  pos         :integer      not null, primary key
#  stop_id     :integer

require_relative './sqlzoo.rb'

def num_stops
  # How many stops are in the database?
  execute(<<-SQL)
  SELECT Count(id)
  FROM stops
  SQL
end

def craiglockhart_id
  # Find the id value for the stop 'Craiglockhart'.
  execute(<<-SQL)
  SELECT
    DISTINCT id
  FROM
    stops
  WHERE
    name = 'Craiglockhart'
  SQL
end

def lrt_stops
  # Give the id and the name for the stops on the '4' 'LRT' service.
  execute(<<-SQL)
  SELECT
    stops.id, stops.name
  FROM
    routes
  JOIN
    stops ON routes.stop_id = stops.id
  WHERE
    routes.num = '4' AND routes.company = 'LRT'
  SQL
end

def connecting_routes
  # Consider the following query:
  #

  #
  # The query gives the number of routes that visit either London Road
  # (149) or Craiglockhart (53). Run the query and notice the two services
  # that link these stops have a count of 2. Add a HAVING clause to restrict
  # the output to these two routes.
  execute(<<-SQL)
  SELECT
    company,
    num,
    COUNT(*)
  FROM
    routes
  WHERE
    stop_id = 149 OR stop_id = 53
  GROUP BY
    company, num
  HAVING
    COUNT(*) = 2
  SQL
end

def cl_to_lr
  # Consider the query:
  #

  # Observe that b.stop_id gives all the places you can get to from
  # Craiglockhart, without changing routes. Change the query so that it
  # shows the services from Craiglockhart to London Road.
  execute(<<-SQL)

   SELECT
     a.company,
     a.num,
     a.stop_id,
     b.stop_id
   FROM
     routes a
   JOIN
     routes b ON (a.company = b.company AND a.num = b.num)
   WHERE
     a.stop_id = 53 AND b.stop_id = 149

  SQL
end

def cl_to_lr_by_name
   #Consider the query:



  # The query shown is similar to the previous one, however by joining two
  # copies of the stops table we can refer to stops by name rather than by
  # number. Change the query so that the services between 'Craiglockhart' and
  # 'London Road' are shown.
  execute(<<-SQL)
  SELECT
    a.company,
    a.num,
    stopa.name,
    stopb.name
  FROM
    routes a
  JOIN
    routes b ON (a.company = b.company AND a.num = b.num)
  JOIN
    stops stopa ON (a.stop_id = stopa.id)
  JOIN
    stops stopb ON (b.stop_id = stopb.id)
  WHERE
    stopa.name = 'Craiglockhart' AND stopb.name = 'London Road'
  SQL
end

def haymarket_and_leith
  # Give the company and num of the services that connect stops
  # 115 and 137 ('Haymarket' and 'Leith')
  execute(<<-SQL)
  SELECT
    DISTINCT a.company, a.num
  FROM
    routes a
  JOIN
   routes b ON (a.company = b.company AND a.num = b.num)
  WHERE
    a.stop_id = 115 AND b.stop_id =137
  SQL
end

def craiglockhart_and_tollcross
  # Give the company and num of the services that connect stops
  # 'Craiglockhart' and 'Tollcross'
  execute(<<-SQL)
    SELECT
      DISTINCT a.company, a.num
    FROM
      routes a
    JOIN
      routes b ON (a.company = b.company AND a.num = b.num)
    JOIN
      stops stopa ON(stopa.id = a.stop_id)
    JOIN
      stops stopb ON(stopb.id = b.stop_id)
    WHERE
      stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'
  SQL
end

def start_at_craiglockhart
  # Give a distinct list of the stops that can be reached from 'Craiglockhart'
  # by taking one bus, including 'Craiglockhart' itself. Include the stop name,
  # as well as the company and bus no. of the relevant service.
  execute(<<-SQL)
    SELECT
      DISTINCT stopb.name, b.company, b.num
    FROM
      routes a
    JOIN
      routes b ON a.company = b.company AND a.num = b.num
    JOIN
      stops stopa ON(stopa.id = a.stop_id)
    JOIN
      stops stopb ON(stopb.id = b.stop_id)
    WHERE
      stopa.name = 'Craiglockhart'

  SQL
end

def craiglockhart_to_sighthill
  # Find the routes involving two buses that can go from Craiglockhart to
  # Sighthill. Show the bus no. and company for the first bus, the name of the
  # stop for the transfer, and the bus no. and company for the second bus.
  execute(<<-SQL)
    SELECT
      DISTINCT first_stop_departure_route.num, first_stop_departure_route.company,
      second_stop.name, second_stop_departure_route.num, second_stop_departure_route.company
    FROM
      routes first_stop_departure_route
    JOIN
      routes second_stop_arrival_route
      ON first_stop_departure_route.company = second_stop_arrival_route.company
        AND first_stop_departure_route.num = second_stop_arrival_route.num
    JOIN
      routes second_stop_departure_route
      ON second_stop_departure_route.stop_id = second_stop_arrival_route.stop_id
    JOIN
      routes third_stop_arrival_route
      ON second_stop_departure_route.company = third_stop_arrival_route.company
        AND second_stop_departure_route.num = third_stop_arrival_route.num
    JOIN
      stops first_stop ON first_stop.id = first_stop_departure_route.stop_id
    JOIN
      stops second_stop ON second_stop.id = second_stop_departure_route.stop_id
    JOIN
      stops third_stop ON third_stop.id = third_stop_arrival_route.stop_id
    WHERE
      first_stop.name = 'Craiglockhart' AND third_stop.name = 'Sighthill'
  SQL
end
