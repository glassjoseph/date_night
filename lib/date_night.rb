require 'pry'

# require './node'

class BinarySearchTree
  attr_reader :node, :left, :right

  def initialize
    @node = nil
  end

  def insert(rating, title)
    if @node.nil?
      @node = Node.new(rating, title)
    else
      @node.insert(rating, title)
    end
    depth_of(rating)
  end
  
  def include?(rating)
    #start at root
    if rating == node.rating
      return true
    else 
      node.include?(rating)
    end
  end
  
  

  def depth_of(rating)
    return nil if include?(rating) == false

    if rating == node.rating
      return node.depth
    else 
      node.depth_of(rating)
    end
  end


  def max
    max = {}

    #VERY Important realization
    #you're in the tree, to get to the roots, you have to call methods on roots 
    if node.right.nil?
      max[@rating] = @title
      max
    else
       node.right.max
    end
  end

  def min
    min = {}
    if node.left.nil?
      min[@rating] = @title
      min
    else
       node.left.min
    end
  end


#start at the roots
#array of hashes title =>score
  def sort
    sorted = []
    movie = {}
    sorted << movie[@title] = @score
    current_root = node

    if node.left.nil? == false
      #it's the lowest
      sort method
    #in_order_tree traversal
    else
    end
    #go left
      # then call sort
      #   until @left == min
      #   end

  end


  def traverse
  end


  def load(file)
    movies = File.open(file, 'r')
    movies_array = []
    movies.each_line do |line|
      line = line.chomp
      line = line.split(", ")
      pulled_rating = line[0].to_i
      pulled_title = line[1]
      self.insert(pulled_rating, pulled_title)
    end
  end



end



class Node
 attr_accessor :rating, :title, :left, :right, :depth
  def initialize(rating, title, depth= 0)
    @rating = rating
    @title = title
    @left = nil
    @right = nil
    @depth = depth
  end

  def insert(compare_rating, new_title)
    #check
    if compare_rating < rating
      if left.nil?
        @left = Node.new(compare_rating, new_title, (depth + 1))
      else
        @left.insert(compare_rating,new_title)
      end
    else
      if right.nil?
        @right = Node.new(compare_rating, new_title, (depth + 1))
      else 
        @right.insert(compare_rating, new_title)
      end
    end
  end
 

  


#add depth call into insert

  def include?(compare_rating)
    if compare_rating == self.rating
      return true
    end
    if compare_rating < rating
      if left.nil? == false
        left.include?(compare_rating)
      else
        false
      end
    elsif compare_rating > rating
      if right.nil? == false
        right.include?(compare_rating)

      else
        false
      end
    end
  end

  def depth_of(compare_rating)

    if rating == compare_rating
      return depth
    else

      if compare_rating < rating
        if left.nil? == false
          left.depth_of(compare_rating)
        end
      elsif compare_rating > rating
        if right.nil? == false
          right.depth_of(compare_rating)
        end
      end
    end
  end



  def is_leaf?
    @left.nil? && @right.nil?
  end

  def is_root
  end

  

  def max
    max = {}
    if @right.nil?
      max[@title] = @rating
      max
    else
       @right.max
    end 
  end


  def min
    min = {}
    if @left.nil?
      min[@title] = @rating
      min
    else
       @left.min
    end 
  end

end

# tree = BinarySearchTree.new
# tree.insert(50, "Movie")
# tree.insert(60, "Nice Movie")
# tree.insert(40, "Bad Movie")
# tree.insert(70, "Very Nice Movie")

tree = BinarySearchTree.new

# binding.pry

""



#can't call instance vars outside of class, need attr_reader/writer/accessor
#testing >> very methodical 
#common mistakes, get ahead of self, miss a step, testing fixes that
#pseudocode before coding

#Have the test drive as much as possible.

#steph - sort needs second test file?
