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

RSpec.describe LinkedList, "#contains" do
  context "when the passed in value is in the list" do
    it "returns true" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      expect(linked_list.contains?(70)).to be_truthy
    end
  end

  context "when the passed in value is not in the list" do
    it "returns false" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      expect(linked_list.contains?(90)).to be_falsey
    end
  end

  context "when the list is empty" do
    it "returns false" do
      linked_list = LinkedList.new

      expect(linked_list.contains?(10)).to be_falsey
    end
  end
end

RSpec.describe LinkedList, "#find" do
  context "when the passed in value is in the list" do
    it "returns the index of the node containing the value" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      expect(linked_list.find(60)).to eq 1
    end
  end

  context "when the passed in value is not in the list" do
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

      expect(linked_list.find(40)).to be_nil
    end
  end

  context "when the list is empty" do
    it "returns false" do
      linked_list = LinkedList.new

      expect(linked_list.find(10)).to be_nil
    end
  end
end

RSpec.describe LinkedList, "#to_s" do
  context "when the list has nodes" do
    it "returns the node's string representation" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      string_rep = linked_list.to_s
      expect(string_rep.scan("->").count).to eq(4)
      expect(string_rep).to eq("( 50 ) -> ( 60 ) -> ( 70 ) -> ( 80 ) -> nil")
    end
  end

  context "when the list is empty" do
    it "returns nil" do
      linked_list = LinkedList.new

      string_rep = linked_list.to_s
      expect(string_rep).to be_nil
    end
  end
end

RSpec.describe LinkedList, "#insert_at" do
  context "when inserting the node somewhere in the middle" do
    it "inserts the node at the given index" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      inserted = linked_list.insert_at(90, 2)

      expect(inserted).to be_truthy
      expect(linked_list.size).to eq 5

      expect(linked_list.at(1).next_node).to eq inserted
      expect(linked_list.at(2)).to eq inserted
      expect(linked_list.at(2).value).to eq 90
      expect(linked_list.at(2).next_node).to eq node3
      expect(linked_list.at(3)).to eq node3
    end
  end

  context "when inserting at index 0" do
    it "inserts the node at index 0" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      inserted = linked_list.insert_at(40, 0)

      expect(inserted).to be_truthy
      expect(linked_list.size).to eq 5

      expect(linked_list.at(0)).to eq inserted
      expect(linked_list.at(0).value).to eq 40
      expect(linked_list.at(0).next_node).to eq node
      expect(linked_list.at(1)).to eq node
      expect(linked_list.head).to eq inserted
    end
  end

  context "when inserting right after the last index" do
    it "appends the node to the list" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)
      
      inserted = linked_list.insert_at(90, 4)

      expect(inserted).to be_truthy
      expect(linked_list.size).to eq 5

      expect(linked_list.at(4)).to eq inserted
      expect(linked_list.at(4).value).to eq 90
      expect(linked_list.at(4).next_node).to be_nil
      expect(linked_list.tail).to eq inserted
    end
  end

  context "when inserting beyond the size" do
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
      
      inserted = linked_list.insert_at(90, 7)

      expect(inserted).to be_nil
      expect(linked_list.size).to eq 4
    end
  end

  context "when inserting to an empty list" do
    it "inserts the new node" do
      linked_list = LinkedList.new

      inserted = linked_list.insert_at(90, 0)

      expect(inserted).to be_truthy
      expect(linked_list.size).to eq 1

      expect(linked_list.at(0)).to eq inserted
      expect(linked_list.head).to eq inserted
      expect(linked_list.tail).to eq inserted
    end
  end
end

RSpec.describe LinkedList, "#remove_at" do
  context "when removing a node somewhere in the middle" do
    it "removes the node successfully" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      removed = linked_list.remove_at(2)

      expect(removed).to be_truthy
      expect(linked_list.size).to eq 3

      expect(linked_list.at(1).next_node).to eq node4
      expect(linked_list.at(2)).to eq node4
    end
  end

  context "when removing at index 0" do
    it "removes the node at index 0" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)

      removed = linked_list.remove_at(0)

      expect(removed).to be_truthy
      expect(linked_list.size).to eq 3

      expect(linked_list.at(0)).to eq node2
      expect(linked_list.head).to eq node2
    end
  end

  context "when removing the last node" do
    it "removes the last node" do
      linked_list = LinkedList.new
      node = Node.new(50)
      node2 = Node.new(60)
      node3 = Node.new(70)
      node4 = Node.new(80)

      linked_list.append(node)
      linked_list.append(node2)
      linked_list.append(node3)
      linked_list.append(node4)
      
      removed = linked_list.remove_at(3)

      expect(removed).to be_truthy
      expect(linked_list.size).to eq 3

      expect(linked_list.at(2)).to eq node3
      expect(linked_list.at(2).next_node).to be_nil
      expect(linked_list.tail).to eq node3
    end
  end

  context "when removing beyond the size" do
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
      
      removed = linked_list.remove_at(4)

      expect(removed).to be_nil
      expect(linked_list.size).to eq 4
    end
  end

  context "when removing from an empty list" do
    it "does nothing" do
      linked_list = LinkedList.new

      removed = linked_list.remove_at(0)

      expect(removed).to be_nil
      expect(linked_list.size).to eq 0

      expect(linked_list.head).to be_nil
      expect(linked_list.tail).to be_nil
    end
  end
end
