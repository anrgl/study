module Exercise
  module Arrays
    class << self
      def replace(array)
        max_num = array.first
        array.each { |item| max_num = item if item > max_num }
        array.map { |item| item.positive? ? max_num : item }
      end

      def search(array, query)
        index = array.length / 2
        return index if array[index] == query

        bin_search(array, query)
      end

      private

      def bin_search(array, query)
        first = 0
        last = array.length - 1
        i = 0
        while i < array.length
          index = (first + last) / 2
          return index if array[index] == query

          last = index - 1 if array[index] > query
          first = index + 1 if array[index] < query

          i += 1
        end
        -1
      end
    end
  end
end
