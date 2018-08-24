class PolyTreeNode
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end
  
  def parent
    @parent 
  end
  
  def parent=(parent)
    if @parent.object_id != parent.object_id #checking if they are the same object
      #remove self from previous parent's children's array
      @parent.children.delete(self) unless @parent.nil?
      #setting @parent to the new parent 
      @parent = parent 
      #push self into the new parent's children's array 
      @parent.children.push(self) unless @parent.nil?
    end
  end
  
  def children
    @children
  end
  
  def add_child(child_node) #setting the child note to parent (you're inside the parent node)
    child_node.parent=(self)
  end
  
  def remove_child(child_node) #setting the parent to nil
    raise "Not a valid child node" unless self.children.include?(child_node)
    child_node.parent = nil
  end 
  
  
  def value
    @value
  end
  
  def dfs( target_value )
    return self if self.value == target_value
    
    self.children.each do |child| 
      result = child.dfs( target_value )
      #if I found the target, you want to return the result 
      return result unless result.nil? 
    end

    #never found the target when you go down the tree
    nil
  end 
  
  def bfs(target_value)
    array = []
    array << self
    until array.empty?
      node = array.shift
      if node.value == target_value
        return node
      else
        array += node.children
      end
    end
    nil
  end
  
  # def inspect
  #   puts "#{self.object_id} Node: #{self.value}"
  #   puts "  parent: #{@parent.value} children: #{self.children.map {|child| child.value}}"
  # end
end