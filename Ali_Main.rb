$LOAD_PATH << '.'

require 'BST'
require 'help_functions'
def print_tree(my_bst)
  i = ""
  pre = ""
  post = ""
  puts 'Pre order for tree:'
  my_bst.pre_order do |node|
    print "#{node.key}"
    pre << node.key

  end
puts
  #
  puts 'Post order for tree:'
  my_bst.post_order do |node|
    print "#{node.key}"
    post << node.key

  end
puts
  ##
  puts 'IN order for tree:'
  my_bst.in_order do |node|
    print "#{node.key}"
    i << node.key

  end
puts

  big = ["#{pre}" , "#{post}" , "#{i}"]
  big
end

array = ['a','b','m','n','v','c','x','z','l','k','h','f']
bst = BinarySearchTree.new
array.each { |char|
    bst.insert(char)
}

my_array = print_tree(bst) #my_array = [pre, post, in]
infix = my_array[2].scan /\w/
postfix = my_array[1].scan /\w/
n = infix.length
root = Builder_Node.new('A')
root = root.buildTree(infix,postfix,n)
puts '######################################################'
puts '######################################################'
puts '######################################################'
puts
puts
puts 'PreOrder of the newly created tree....'
root.preOrder(root)
