require 'node'

RSpec.describe Node, "#value" do
  context "when a node is initalized" do
    it "initializes the node value to nil" do
      node = Node.new

      expect(node.value).to be_nil
    end

    it "returns the value the node object was initialized with" do
      node = Node.new(50)

      expect(node.value).to eq 50
    end
  end

  context "when the node value is changed" do
    it "returns new value stored in the node" do
      node = Node.new(50)

      node.value = 80
      
      expect(node.value).to eq 80
    end
  end
end

RSpec.describe Node, "#next_node" do
  context "when a node is initialized" do
    it "initializes the node's next_node value to nil" do
      node = Node.new

      expect(node.next_node).to be_nil
    end

    it "returns the next_node value the node object was initialized with" do
      next_node = Node.new
      node = Node.new(50, next_node)

      expect(node.next_node).to eq next_node
    end
  end

  context "when the node's next_node value is changed" do
    it "returns the new next_node value" do
      next_node = Node.new
      node = Node.new(50, next_node)

      node.next_node = nil

      expect(node.next_node).to be_nil
    end
  end
end
