module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?
    arr_ = to_a
    i = 0
    until i == size
      yield arr_.to_a[i]
   
      i += 1
    end
    arr_
  end

  # my_each_with_index

  def my_each_with_index
    return to_enum(:my_each) unless block_given?
    arr = to_a
    i = 0
    until i == size
      yield(  arr [i], i)
      i += 1
    end
    arr 
  end

  # my_select

  def my_select
    return to_enum(:my_select) unless block_given?
    selected_array = []
    arr = to_a
    i = 0
    until i == size
      selected_array << arr[i] if yield(arr[i])
      i += 1
    end
    selected_array
  end

  # my_all

  def my_all?(arg = nil)
    if block_given?
      my_each { |el| return false if yield(el) == false }

      return true
    elsif arg.nil?
      my_each { |k| return false if k.nil? || k == false }
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

  def my_any?(arg = nil)
    if block_given?
      my_each { |el| return true if yield(el) }
      return false
    end
    arg.nil? ? arg.class.to_s : my_any? { |el| el }

    if arg.class.to_s == 'Class'
      my_each { |el| return true if el.is_a? arg }
    elsif arg.class.to_s == 'Regexp'
      my_each { |el| return true if el =~ arg }
    elsif arg.nil?
      each { |el| return true if el }
    else
      my_each { |el| return true if el == arg }
    end
    false
  end

  # my_none

  def my_none?(arg = nil, &block)
    !my_any?(arg, &block)
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
    end
    count
  end
end

# my_map

def my_map(proc = nil)
  return to_enum(:my_map) unless block_given?

  new_array = []
  arr_ = to_a

  if proc.nil?

    arr_.my_each { |i| new_array << yield(i) }
  else
    arr_.my_each { |i| new_array << proc.call(i) }

  end
  new_array
end

def my_inject(arg = nil, sym = nil)
  if (arg.is_a?(Symbol) || arg.is_a?(String)) && (!arg.nil? && sym.nil?)
    sym = arg
    arg = nil
  end

  if !block_given? && !sym.nil?
    my_each { |elt| arg = arg.nil? ? elt : arg.send(sym, elt) }
  else
    my_each { |elt| arg = arg.nil? ? elt : yield(arg, elt) }
  end
  arg
end

def multiply_els(arr_)
  arr_.my_inject do |accum, el|
    accum * el
  end
end

(1..3).my_each {|x| p x}

{1=>1, 2=>2, 3=> 3}.each {|x| puts x}

(1..6).my_select {|x| p x>3}

p (1..3).my_all?
