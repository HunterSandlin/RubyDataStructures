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
        return 1 if not root.children.any?
        root.children.each do | child |
            return countDown(child) + 1
        end 
    end


end