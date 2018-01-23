class Builder_Node
  attr_reader :key, :left, :right

#On initialization, the @key variable is set.
  def initialize(key)
    @key = key
    @left = nil
    @right = nil
    self
  end



  def get_key
    @key
  end

  def get_right
    @right
  end

  def get_left
    @left
  end

  def set_right(node)
    @right = node
  end

def set_left(node)
  @left = node
end

#Inserting at the node level will check what the new key is in order
  def insert( new_key )
    if new_key < @key
      @left.nil? ? @left = Builder_Node.new( new_key ) : @left.insert( new_key )
    elsif new_key > @key
      @right.nil? ? @right = Builder_Node.new( new_key ) : @right.insert( new_key )
    else
      @count = @count + 1
    end
  end

  def search(arr, start, the_end, value)
    i = start
    while i != the_end
      if arr[i] == value
        break
      end
      i = i+1
    end
    i
  end


  def buildUtil(infix, postfix, in_start, in_end, p_index )
    if in_start > in_end
      return nil#Builder_Node.new(nil)
    end
    node = Builder_Node.new(postfix[p_index])
    p_index = p_index - 1
    if in_start == in_end
      return node
    end
    i_index = search(infix, in_start,in_end, node.get_key)

    node.set_right( buildUtil(infix,postfix,i_index + 1, in_end,p_index))
    node.set_left( buildUtil(infix,postfix,in_start,i_index-1,p_index))

    node
  end

  def buildTree(infix,postfix,n)
    p_index = n-1
    return buildUtil(infix,postfix,0,n-1,p_index)
  end

  def inOrder(node)
    if node == nil
      return nil
    end
    inOrder(node.get_left)
    print node.get_key
    inOrder(node.get_right)
  end

  def preOrder(node )
   if node == nil
      return nil
    end
    print node.get_key
    self.inOrder(node.get_left)
    self.inOrder(node.get_right)
  end


end
