class Node
    attr_reader :value
    attr_accessor :children
    def initialize(value, children = [])
        @value = value 
        @children = Array(children)
    end
end