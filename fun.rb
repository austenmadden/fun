require 'pry'

class Fun
  class << self
    def is_palindrome?(word)
      charcters = word.downcase.chars

      while charcters.size > 1 do
        return false if charcters.pop != charcters.shift
      end

      true
    end

    def fizzbuzz(range)
      for i in 0..range
        string = ""
        string << "fizz" if i % 3 == 0
        string << "buzz" if i % 5 == 0

        unless string.empty?
          puts string
        else
          puts i
        end
      end
    end

    def roman_numeral_writer(input)
      numbers_with_numerals = {
        'M' => 1000,
        'CM' => 900,
        'D' => 500,
        'CD' => 400,
        'C' => 100,
        'XC' => 90,
        'L' => 50,
        'XL' => 40,
        'X' => 10,
        'IX' => 9,
        'V' => 5,
        'IV' => 4,
        'I' => 1
      }

      numeral = ''

      numbers_with_numerals.each do |k, v|
        div, rem = input.divmod(v)
        if div > 0
          div.times { numeral << k }
          input = rem
        end
      end

      numeral
    end

    def max(x, y)
      (x > y) ? x : y
    end

    def kandane(array = [])
      max_ending_here = max_so_far = array[0]

      for x in array[1..-1]
        max_ending_here = max(x, max_ending_here + x)
        max_so_far = max(max_so_far, max_ending_here)
      end

      max_so_far
    end

    def kandane_array(array = [])
      max_ending_here = max_so_far = array[0]
      i1, i2 = 0

      array[1..-1].each_with_index do |x, i|
        max_ending_here = max(x, max_ending_here + x)
        if max_so_far <= max(max_so_far, max_ending_here)
          max_so_far = max_ending_here
          if max_ending_here == x
            i1 = i2 = i + 1
          else
            i2 = i + 1
          end
        end
      end

      array[i1..i2]
    end
  end
end
