def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books WHERE books.series_id = 1 ORDER BY books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  #"SELECT name, motto FROM characters WHERE motto = (SELECT MAX(LENGTH(motto)) FROM characters);"
    "SELECT name, motto FROM characters ORDER BY LENGTH(motto) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species) FROM characters GROUP BY species ORDER BY COUNT(species) DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM series JOIN authors ON series.author_id = authors.id JOIN subgenres ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series JOIN characters ON series.id = characters.series_id
  WHERE characters.series_id = (SELECT series_id FROM characters WHERE characters.species = 'human' GROUP BY characters.series_id ORDER BY COUNT(*) DESC LIMIT 1)
  GROUP BY series.id;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, count(*) FROM character_books JOIN characters ON character_books.character_id = characters.id GROUP BY character_id ORDER BY count(*) DESC, characters.name ASC;"
end
