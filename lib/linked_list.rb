require 'node'

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = @tail.next_node
    end

    @size += 1
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end

    @size += 1
  end

  def at(index)
    return nil if index > @size - 1 || index < 0

    node = @head
    (0...index).each { |tmp| node = node.next_node } # TODO: refactor

    node
  end

  # TODO: refactor
  def pop
    return nil if @size == 0

    old_last = @head
    new_last = nil

    if @size == 1
      @head = nil
      @tail = nil
      @size -= 1

      return old_last
    end

    (0...@size - 1).each do |tmp|
      new_last = old_last
      old_last = old_last.next_node
    end

    new_last.next_node = nil
    @tail = new_last
    @size -= 1

    old_last
  end

  def contains?(value)
    return false if @size == 0

    node = @head
    loop do
      break if node.nil?

      if node.value == value
        return true
      else
        node = node.next_node
      end
    end

    false
  end

  def find(value)
    return nil if @size == 0

    node = @head
    index = 0

    loop do
      break if node.nil?

      if node.value == value
        return index
      else
        node = node.next_node
        index += 1
      end
    end

    nil
  end

  def to_s
    return nil if @size == 0

    node =  @head
    ret = ""
    loop do
      break if node.nil?

      ret += "( #{node.value} )"
      ret += " -> "

      node = node.next_node
    end

    ret += "nil"
  end

  def insert_at(value, index)
    return nil if index > @size

    node_at_index = nil
    new_node = Node.new(value)

    if index == 0
      node_at_index = @head
      @head = new_node
    else
      node_before_index = before(index)
      node_at_index = node_before_index.next_node
      node_before_index.next_node = new_node
    end

    new_node.next_node = node_at_index
    @tail = new_node if new_node.next_node.nil?
    @size += 1

    new_node
  end

  def remove_at(index)
    return nil if @size == 0 || index > @size - 1

    node_at_index = nil

    if index == 0
      node_at_index = @head
      @head = @head.next_node
    else
      node_before_index = before(index)
      node_at_index = node_before_index.next_node
      node_before_index.next_node = node_at_index.next_node

      if node_before_index.next_node.nil?
        @tail = node_before_index
      end
    end

    @size -= 1
    node_at_index
  end

  private
  def before(index)
    return nil if @size == 0
    return nil if index <= 0
    return nil if index > @size

    before = @head
    (1...index).each { |tmp| before = before.next_node }

    before
  end
end
