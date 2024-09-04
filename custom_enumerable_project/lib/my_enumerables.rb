module Enumerable
  # Your code goes here
  def my_each_with_index 
    index = 0
    self.each do |element|
      yield(element,index)
      index += 1
    end
  end

  def my_select
    selected_element = []
    self.each do |element|
     if yield(element)
      selected_element << element
     end
    end
    selected_element
  end

  def my_all?
    flag = true
    self.each do |element|
      if yield(element)!= true
        flag = false
        return flag 
      end
    end
    return flag
  end

  def my_any?
    flag = false
    self.each do |element|
      if yield(element)
        flag = true
        return flag
      end
    end
    return flag
  end
#none no funciona
    
  def my_none?
    self.each do |element|
    if yield(element)
      return false
    end
    end
    true
  end

  def my_count
    count = 0
    self.each do |element|
      if block_given? 
        if yield(element)
          count += 1
        end
      else count += 1

      end
    end
    return count
  end

  def my_map
    array = []
    self.each do |element|
      array << yield(element)
    end
    return array
  end

  def my_inject(initial_value = nil)
    accumulator = initial_value.nil? ? self.first : initial_value
  
    self.each do |element|
      accumulator = yield(accumulator, element)
    end
  
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each
    for i in 0...self.length 
      yield(self[i])
    end
    self
  end
end

