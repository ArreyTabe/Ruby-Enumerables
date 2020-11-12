module Enumerable

    
    def my_each
       return self.dup unless block_given?
        i = 0
        until i == self.size
            yield  self[i]

            i += 1
        end
       self
    end


test_collect = ["goond","young", "lappy", "shangai"]


test_collect.my_each do |el|
    puts "The test array contains the nonsense #{el}"

    
end

puts
# my_each_with_index

def my_each_with_index
    return self.dup unless block_given?
      i = 0 
      until i == self.size
          yield self[i]
          i +=1
      end
      self
  end



test_collect = [23,34,56,78,45]

test_collect.my_each_with_index  do |el,index|
   puts "index #{index} for #{el}" 
end

puts

# my_select

def my_select
    return self.dup unless block_given?
    selected_array = []
    i = 0 
    until i == self.size
        selected_array<< yield(self[i])
    i +=1
  end
  selected_array

end


  test_collect = ["binta", "gabru", "sharon"]

  test_collect.my_select do |el|
      puts el if el != "sharon"


end

puts

# my_all


def my_all

    return self.dup unless block_given?

    i = 0
    arr_res = []
    until i == self.size
     arr_res << yield(self[i])
        i += 1
    end  
    if arr_res.include?(false)
      p false
    else
     p true
    end
  end
   

d = [4, -5, 2, 8]

d.my_all do |el|

   el > 0
end

#  my_any

def my_any

    return self.dup unless block_given?

    i = 0
    arr_res = []
    until i == self.size
     arr_res << yield(self[i])
        i += 1
    end  
    if arr_res.include?(true)
      p true
    else
     p false
    end
  end

d = [-4, 5, -2, -8]

d.my_any do |el|

   el > 0
end

puts 

# my_none

def my_none 

    return self.dup unless block_given?

    i = 0
    arr_check = []

    until i == self.size 

        arr_check.push(yield(self[i]))

        i += 1
    end
        if arr_check.include?(true)
            p false
        else
            p true
        end
    end

coll_arr = [-4, 5, -2, -8]

coll_arr.my_none do |el|

   el > 0
end

# my_count

def my_count(*arg)
  if arg.length.positive?
    count = 0
    my_each do |ele|
      count += 1 if ele == arg[0]
    end
    return count
  elsif arg.length.zero? && !block_given?
    count = 0
    my_each do |_ele|
      count += 1
    end
    return count
  end
  count = 0
  my_each { |ele| count += 1 if yield ele }
  count
end

# my_map

def my_map
  return self.dup unless block_given?
  new_array = []
  i = 0 
  until i == self.size
      new_array<< yield(self[i])
  i +=1
end
 new_array

end
end

test_collect = [3, 4, 5]

test_collect.my_map do |el|
     puts el + 2


end

puts


def my_inject(accumulator, &block)
 until i == self.size
    accumulator = block.call(accumulator, element)
  end
  accumulator
end