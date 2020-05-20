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
    (0...index).each { |tmp| node = node.next_node }

    node
  end

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
end
