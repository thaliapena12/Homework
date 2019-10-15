class GraphNode
    attr_accessor :value, :neighbors
    def initialize(value)
        self.value = value
        self.neighbors = []
    end

    def neighbors(neighbor)
        self.neighbors << neighbor
    end

    def bfs(starting_node, target)
        all_nodes = Set.new()
        nodes = [starting_node]
        until nodes.empty?
            unless all_nodes.include?(node)
                node = nodes.shift
                return node.value if node.value == target
                all_nodes.add(node)
                node += node
            end
        end
      return nil
    end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
p e.neighbors = [a]
 f.neighbors = [e]