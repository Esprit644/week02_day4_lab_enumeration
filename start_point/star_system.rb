class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
 end

 def has_planets_in_solar_system
    @planets.count
 end


 def planet_names
   @planets.map { |planet| planet.name }
 end

 def get_planet_by_name(planet_search)
   @planets.find {|planet| planet.name == planet_search}
 end

 def get_largest_planet
   #    empty_array = []
   # for planet in @planets
   #   empty_array.push(planet.diameter)
   # end
   # sorted_sizes = empty_array.sort
   # max_size = sorted_sizes.last
   # return @planets.find {|planet| planet.diameter == max_size}
   @planets.sort{ |planet1, planet2| planet2.diameter <=> planet1.diameter}.first
 end

 def get_smallest_planet
   @planets.sort{ |planet1, planet2| planet2.diameter <=> planet1.diameter}.last
 end

 def get_planets_with_no_moons
   @planets.find_all {|planet| planet.number_of_moons == 0}
 end

 def get_planets_with_more_moons(number_of_moon_search)
  moon_planets = @planets.find_all{|planet| planet.number_of_moons > number_of_moon_search}
  moon_planets.map {|planet| planet.name}
 end

 def get_number_of_planets_closer_than(distance)
   moon_planets = @planets.find_all{|planet| planet.distance_from_sun < distance}
   moon_planets.count
 end

 def get_total_number_of_moons
 moons = @planets.map { |planet| planet.number_of_moons }
 moons.reduce{|running_total, num| running_total + num}
 end

 def get_planet_names_sorted_by_increasing_distance_from_sun
    planets_distance = @planets.sort{ |planet1, planet2| planet1.distance_from_sun <=> planet2.distance_from_sun}
    p planets_distance.map {|planet| planet.name}
 end

 def get_planet_names_sorted_by_size_decreasing
    planets_size = @planets.sort{ |planet1, planet2| planet2.diameter <=> planet1.diameter}
    p planets_size.map {|planet| planet.name}
 end


end
