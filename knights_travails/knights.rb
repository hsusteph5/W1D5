require_relative '../polytreenode/lib/00_tree_node.rb'

class KnightPathFinder
  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    self.build_move_tree
  end
  
  def build_move_tree
    
  end
  
  def self.valid_moves(pos)
    array = []
    [[1,2],[2,1],[-1,2],[2,-1],[1,-2],[-2,1],[-1,-2],[-2,-1]]
    
  end 
end