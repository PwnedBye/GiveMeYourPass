# ##############
# Configuration
# ##############

# Ages, postal codes, region codes, birth years, etc...
NUMBERS = [
  1990,
  90,
  1992,
  92,
  75000
]

# Family names, animal names, pseudonyms, etc...
NAMES = [
  'john',
  'JohnDoe',
  'Doe',
  'Johnathan',
  'Jonathan',
  'Karen',
  'Kar'
]

# Cities, places, etc...
LOCATIONS = [
  'Paris',
  'France',
  'Toulouse',
  'Marseille'
]

# Sports, Musics, Movies
HOBBIES = [
  'Dev',
  'Dance',
  'Vaskojabata',
  'Surfing',
  'Surf'
]

# Special characters
SPECIAL_CHARS = [
  '*',
  '!',
  '@',
  '#',
  '$',
  '%',
  '^',
  '&',
  '(',
  ')',
  '-'
]

# Method to generate combinations
def generate_combinations(numbers, names, locations, hobbies, special_chars)
  combinations = []

  # Helper to generate variations of a string
  def generate_variations(str)
    [str.downcase, str.upcase, str.capitalize]
  end

  # Helper to add special characters
  def add_special_chars(combo, special_chars)
    special_combos = []
    special_chars.each do |char|
      special_combos << "#{combo}#{char}"
    end
    special_combos
  end

  # Generate and store combinations
  def add_combinations(item1, item2, combinations, special_chars)
    base_combos = []
    base_combos.concat(generate_variations("#{item1}#{item2}"))
    base_combos.concat(generate_variations("#{item2}#{item1}"))
    base_combos.each do |combo|
      combinations << combo
      combinations.concat(add_special_chars(combo, special_chars))
    end
  end

  # Combine elements from different categories
  [numbers, names, locations, hobbies].combination(2).each do |list1, list2|
    list1.each do |item1|
      list2.each do |item2|
        add_combinations(item1, item2, combinations, special_chars)
      end
    end
  end

  combinations.uniq
end

# Generate the combinations
combinations = generate_combinations(NUMBERS, NAMES, LOCATIONS, HOBBIES, SPECIAL_CHARS)

# Save the combinations to a file
def save_to_file(combinations, filename)
  File.open(filename, 'w') do |file|
    combinations.each { |combo| file.puts(combo) }
  end
end

# Specify the filename
filename = 'dictionary.txt'

# Save the combinations to the specified file
save_to_file(combinations, filename)

puts "Dictionary saved to #{filename}"
