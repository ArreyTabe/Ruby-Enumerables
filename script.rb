module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    until i == size
      yield self[i]

      i += 1
    end
    self
  end

  # my_each_with_index

  def my_each_with_index
    return to_enum(:my_each) unless block_given?

    i = 0
    until i == size
      yield(self[i], i)
      i += 1
    end
    self
  end

  # my_select

  def my_select
    return to_enum(:my_select) unless block_given?

    selected_array = []
    i = 0
    until i == size
      selected_array<<self[i] if yield(self[i])
      i += 1
    end
    selected_array
  end

  # my_all

  def my_all? (arg = nil)
   
    if block_given? 
        my_each { |el| return false if yield(el) == false }  
        return true
        elsif arg.nil?
        my_each {|k| return false if k.nil? || k == false}
        elsif !arg.nil? && (arg.is_a? Class)
         my_each { |k| return false if k.class != arg }
        elsif !arg.nil? && arg.instance_of?(Regexp)
        my_each { |k| return false unless arg.match(k) }
    else
      my_each { |k| return false if k != arg }
    end
    true
    end
        
        
  #  my_any

  def my_any
    return dup unless block_given?

    i = 0
    arr_res = []
    until i == size
      arr_res << yield(self[i])
      i += 1
    end
    if arr_res.include?(true)
      p true
    else
      p false
    end
  end

  # my_none

  def my_none
    return dup unless block_given?

    i = 0
    arr_check = []

    until i == size

      arr_check.push(yield(self[i]))

      i += 1
    end
    if arr_check.include?(true)
      p false
    else
      p true
    end
  end

  # my_count

  def my_count(*arg)
    count = 0
    if block_given?
      my_each do |ele|
        count += 1 if yield(ele)
      end
      count

    elsif arg.length.positive?

      my_each do |ele|
        count += 1 if ele == arg[0]
      end
      count
    elsif arg.length.zero? && !block_given?
      count = 0
      my_each do |_ele|
        count += 1
      end
      count
    end
  end

  # my_map

  def my_map(proc = nil)
    return to_enum(:my_map) unless block_given?

    new_array = []

    if proc.nil?
      my_each { new_array << yield(self[i]) }
    else
      my_each new_array << proc.call(self[i])
    end
    new_array
  end
end

def my_inject(arg)
  raise LocalJumpError, 'no block given?' unless block_given? || arg.length.positive?

  return Helper.block_not_given(self, arg) unless block_given?

  # if block is given
  if arg.length.positive?
    accumulator = arg[0]
    i = 0
  elsif arg.length.zero?
    accumulator = first
    i = 1
  end
  (i..(size - 1)).my_each do |index|
    accumulator = yield accumulator, *self[index]
  end
  accumulator
end

def multiply_els(arr_)
  arr_.my_inject do |accum, el|
    accum * el
  end
end
