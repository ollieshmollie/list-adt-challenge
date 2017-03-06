require_relative 'fixed_array'
require_relative 'exceptions'

class ArrayList
  def initialize
    self.contents = FixedArray.new(0)
  end

  def get(index)
    raise_no_such_element_error if out_of_bounds?(index)
    contents.get(index)
  end

  def set(index, element)
    raise_no_such_element_error if out_of_bounds?(index)
    contents.set(index, element)
  end

  def first
    raise_no_such_element_error if length == 0    
    contents.get(0)
  end

  def last
    raise_no_such_element_error if length == 0
    contents.get(length - 1)
  end

  def add(element)
    new_contents = FixedArray.new(contents.size + 1)
    i = 0
    while i < contents.size
      new_contents.set(i, contents.get(i))
      i += 1
    end
    self.contents = new_contents
    contents.set(new_contents.size - 1, element)
  end

  def insert(index, element)
    new_contents = FixedArray.new(contents.size + 1)
    if length == 0
      new_contents.set(0, element)
      self.contents = new_contents
    else
      raise_out_of_bounds(index) if out_of_bounds?(index) 
      i = 0
      while i < index
        new_contents.set(i, contents.get(i))
        i += 1        
      end
      new_contents.set(index, element)
      i = index
      while i < length
        new_contents.set(i + 1, contents.get(i))
        i += 1
      end
      self.contents = new_contents
    end
  end

  def length
    contents.size
  end

  private
    attr_accessor :contents

    def raise_no_such_element_error
      raise NoSuchElementError, "No element exists at specified index"
    end

    def raise_out_of_bounds(index)
      raise OutOfBoundsError.new("The index #{index} outside the bounds of this FixedArray of size #{length}")
    end

    def out_of_bounds?(index)
      return index < 0 || index >= length
    end
end
