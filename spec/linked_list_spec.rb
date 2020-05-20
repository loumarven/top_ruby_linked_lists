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

RSpec.describe LinkedList, "#at" do
  context "when the index is valid" do
    it "returns the node at the given index" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      expect(linked_list.at(2)).to eq node3
    end
  end

  context "when the index is greater than #size" do
    it "returns nil" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      expect(linked_list.at(4)).to be_nil
    end
  end

  context "when the index negative" do
    it "returns nil" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      expect(linked_list.at(-2)).to be_nil
    end
  end
end

RSpec.describe LinkedList, "#pop" do
  context "when there are many nodes" do
    it "removes the last element from the list" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)
      
      expect(linked_list.size).to eq 4

      popped = linked_list.pop

      expect(popped).to eq node4
      expect(linked_list.size).to eq 3
      expect(linked_list.tail).to eq node3
    end
  end

  context "when there is 1 node" do
    it "empties the list" do
      linked_list = LinkedList.new
      node = Node.new(50)

      linked_list.append(node)

      expect(linked_list.size).to eq 1

      popped = linked_list.pop

      expect(popped).to eq node
      expect(linked_list.size).to eq 0
      expect(linked_list.head).to be_nil
      expect(linked_list.tail).to be_nil
    end
  end

  context "when the list is empty" do
    it "pops nothing" do
      linked_list = LinkedList.new

      expect(linked_list.size).to eq 0

      popped = linked_list.pop

      expect(popped).to be_nil
      expect(linked_list.size).to eq 0
      expect(linked_list.head).to be_nil
      expect(linked_list.tail).to be_nil
    end
  end
end
