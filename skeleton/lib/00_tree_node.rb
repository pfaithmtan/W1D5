class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent=(new_parent)
    
    if @parent != nil 
      @parent.children.delete(self)
    end
    
    if new_parent != nil 
      new_parent.children << self unless new_parent.children.include?(self)      
    end
    
    @parent = new_parent
    
  end
  
  def children
    @children 
  end
  
  def value
    @value
  end
  
  def inspect
    return "Value : #{@value}, Parent: #{@parent}, Children: #{@children}"
  end
  
  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Node is not a child!" if child_node.parent == nil 
    child_node.parent = nil
  end
  
  def dfs(target_value)
    return self if @value == target_value
    
    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil? 
    end
    
    nil
  end 
  
  def bfs(target_value)
    line = []
    line.push(self)
    # p line
    
    until line.empty?
      current_node = line.shift
      return current_node if current_node.value == target_value
      
      current_node.children.each { |kid| line << kid }
      # p line
    end 
    
    nil
  end 
  
  
end