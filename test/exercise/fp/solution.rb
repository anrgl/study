module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films = array.reject { |f| f['country'].nil? }
        films = films.select { |f| f['country'].split(',').size > 1 }
        films = films.reject { |f| f['rating_kinopoisk'].nil? }
        films = films.reject { |f| f['rating_kinopoisk'] == '0' }
        total = films.reduce(0) { |sum, f| sum + f['rating_kinopoisk'].to_f }
        total / films.length
      end

      def chars_count(films, threshold)
        kp_films = films.reject { |f| f['rating_kinopoisk'].nil? }
        kp_films = kp_films.select { |f| f['rating_kinopoisk'].to_f >= threshold }
        kp_films.reduce(0) { |sum, f| sum + f['name'].count('и') }
      end
    end
  end
end
