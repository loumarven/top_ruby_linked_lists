require 'linked_list'

RSpec.describe LinkedList, "#append" do
  it "adds a new node to the end of the list" do
    linked_list = LinkedList.new
    node = Node.new(50)
      
    linked_list.append(node)

    expect(linked_list.tail).to eq node
  end
end

RSpec.describe LinkedList, "#prepend" do
  it "adds a new node to the start of the list" do
    linked_list = LinkedList.new
    node = Node.new(50)

    linked_list.prepend(node)

    expect(linked_list.head).to eq node
  end
end

RSpec.describe LinkedList, "#size" do
  it "returns the total number of nodes in the list" do
    linked_list = LinkedList.new
    node = Node.new(50)
    node2 = Node.new(60)

    linked_list.append(node)
    linked_list.append(node2)

    expect(linked_list.size).to eq 2
  end
end
