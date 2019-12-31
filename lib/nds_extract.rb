$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  names = []        # make a names array
  i = 0 
  
  while i<source.length do
    names[i] = source[i][:name]     # loop through the hash to find the names and add it to the names array
    i += 1
  end
  names
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  total = 0
  i = 0 
  dir_total = directors_totals(source)
  list_dir = list_of_directors(source)
  
  while i<source.length do 
    name = list_dir[i]  #assigns directors name from the array to the local variable "name"
    total += dir_total[name]    # calls directors_totals method to find the total for the name matching "name" local var
    i+=1
  end
  total
end


