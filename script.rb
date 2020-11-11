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
end

test_collect = ["goond","young", "lappy", "shangai"]


test_collect.my_each do |el|
    puts "The test array contains the nonsense #{el}"

    
end