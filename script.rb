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

  test_collect = %w[goond young lappy shangai]

  test_collect.my_each do |el|
    puts "The test array contains the nonsense #{el}"
  end

  puts
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

  test_collect = [23, 34, 56, 78, 45]

  test_collect.my_each_with_index do |el, index|
    puts "index #{index} for #{el}"
  end

  puts

  # my_select

  def my_select
    return to_enum(:my_select) unless block_given?

    selected_array = []
    i = 0
    until i == size
      selected_array << yield(self[i])
      i += 1
    end
    selected_array
  end

  test_collect = %w[binta gabru sharon]

  test_collect.my_select do |el|
    puts el if el != 'sharon'
  end

  puts

  # my_all

  def my_all
    return dup unless block_given?

    i = 0
    arr_res = []
    until i == size
      arr_res << yield(self[i])
      i += 1
    end
    if arr_res.include?(false) && arr_res.include?(nil)
      p false
    else
      p true
    end
  end

  d = [4, -5, 2, 8]

  d.my_all(&:positive?)

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

  d = [-4, 5, -2, -8]

  d.my_any(&:positive?)

  puts

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

  coll_arr = [-4, 5, -2, -8]

  coll_arr.my_none(&:positive?)

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
    # count = 0
    # my_each { |ele| count += 1 if yield ele }
    # count

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

  puts

  def my_inject(*arg)
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
end

def multiply_els(arr_)
  arr_.my_inject do |accum, el|
    accum * el
  end
end

# p multiply_els([5, 6, 2])
