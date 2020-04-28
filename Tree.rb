class Tree
    attr_accessor :root
    def initialize(root = nil)
        @root = root
    end

=begin
    return medium sized tree with a few branches
=end
    def self.make_tree()
        node6 = Node.new(6, [])
        node7 = Node.new(7, [])
        node5 = Node.new(5, [node6, node7])
        node3 = Node.new(3)
        node2 = Node.new(2, [node3, node5])
        node4 = Node.new(4)
        node1 = Node.new(1, [node2, node4])
        Tree.new(node1)
    end

=begin
    return large tree with a several branches, depth of 6
=end
def self.make_big_tree()
    node11 = Node.new(11)
    node10 = Node.new(10, [node11])
    node9 = Node.new(9)
    node8 = Node.new(8)
    node6 = Node.new(6, [node8, node9, node10])
    node7 = Node.new(7)
    node5 = Node.new(5, [node6, node7])
    node3 = Node.new(3)
    node2 = Node.new(2, [node3, node5])
    node4 = Node.new(4)
    node1 = Node.new(1, [node2, node4])
    Tree.new(node1)
end

=begin
    return short straight tree 1 -> 2 -> 3-> 4
=end
    def self.make_stick()
        node4 = Node.new(4)
        node3 = Node.new(3, [node4])
        node2 = Node.new(2, [node3])
        node1 = Node.new(1, [node2])
        Tree.new(node1)
    end

=begin
    return big straight tree 1 -> 2 -> 3 ... -> 10
=end
    def self.make_big_stick()
        node10 = Node.new(10)
        node9 = Node.new(9, [node10])
        node8 = Node.new(8, [node9])
        node7 = Node.new(7, [node8])
        node6 = Node.new(6, [node7])
        node5 = Node.new(5, [node6])
        node4 = Node.new(4, [node5])
        node3 = Node.new(3, [node4])
        node2 = Node.new(2, [node3])
        node1 = Node.new(1, [node2])
        Tree.new(node1)
    end

=begin
    prints the entire tree horizontally
    siblings are on sam vertical line
    parents are to the left of children

    Call without args, those are for recusive calls 
=end  
    def printTree(root = @root, indentation = "\n")
        #print root the first time running mehtod, the rest will be printed as children
        puts "#{indentation}#{root.value}" if root == @root
        root.children.each do | child |
            puts "#{indentation}\t#{child.value}\n"
            #if there are children, again
            printTree(child, indentation + "\t") if child.children.any?
        end
    end

=begin
    counts down through the tree recusively
    returns lowest level
=end
    def countDown(root = @root)
        #if there are no children, return one to count that node
        return 1 if not root.children.any?
        #array to store each possible depth
        branches = []
        root.children.each do | child |
            #recursively find each child and add one for each
            branches.push(countDown(child) + 1)
        end 
        #all possible depthes are in branches, return the deepest
        return branches.max
    end


end