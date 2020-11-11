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
end

  test_collect = ["binta", "gabru", "sharon"]

  test_collect.my_select do |el|
      puts el if el != "sharon"


end