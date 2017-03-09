require_relative 'exceptions'

class LinkedList
  attr_reader :length
  def initialize
    @head = Node.new
    @length = 0
  end

  def add(element)
    curr_node = @head
    while !curr_node.next.nil?
      curr_node = curr_node.next
    end
    curr_node.next = Node.new(element)
    self.length = length + 1
    curr_node.next.element
  end

  def get(index)
    raise_no_such_element_error if out_of_bounds?(index)
    count = 0
    curr_node = @head.next
    while count < index
      curr_node = curr_node.next
      count += 1
    end  
    curr_node.element
  end

  def set(index, element)
    raise_no_such_element_error if out_of_bounds?(index)
    count = 0
    curr_node = @head.next
    while count < index
      curr_node = curr_node.next
      count += 1
    end
    curr_node.element = element
  end

  def first
    raise_no_such_element_error if empty?
    @head.next.element
  end

  def last
    raise_no_such_element_error if empty? 
    curr_node = @head.next
    while !curr_node.next.nil?
      curr_node = curr_node.next
    end
    curr_node.element
  end

  private
    attr_writer :length

    def raise_no_such_element_error
      raise NoSuchElementError
    end

    def out_of_bounds?(index)
      index < 0 || index >= length
    end

    def empty?
      length == 0
    end
end
