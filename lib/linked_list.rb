require_relative 'exceptions'

class LinkedList
  attr_reader :length
  def initialize
    self.head = Node.new
    @length = 0
  end

  def add(element)
    last_node.next = Node.new(element)
    self.length = length + 1
    element
  end

  def get(index)
    raise_no_such_element_error if out_of_bounds?(index)
    find(index).element
  end

  def set(index, element)
    raise_no_such_element_error if out_of_bounds?(index)
    find(index).element = element
  end

  def insert(index, element)
    if empty?
      @head.next = Node.new(element)
    else
      raise_out_of_bounds_error if out_of_bounds?(index)
      new_node = Node.new(element)
      prev_node = find(index - 1)
      new_node.next = prev_node.next
      prev_node.next = new_node
    end
    self.length = length + 1
  end

  def first
    raise_no_such_element_error if empty?
    head.next.element
  end

  def last
    raise_no_such_element_error if empty? 
    last_node.element
  end

  private
    attr_writer :length
    attr_accessor :head

    def last_node
      find(length - 1)
    end

    def find(index, curr_node=head)
      0.upto(index) do
        curr_node = curr_node.next
      end
      curr_node
    end

    def raise_no_such_element_error
      raise NoSuchElementError
    end

    def raise_out_of_bounds_error
      raise OutOfBoundsError
    end

    def out_of_bounds?(index)
      index < 0 || index >= length
    end

    def empty?
      length == 0
    end
end
