require_relative  'Tree'
require_relative  'Node'
#set up tree
myTree = Tree.make_tree()

myTree.printTree()
puts "--------------------\n\n"
puts myTree.countDown()