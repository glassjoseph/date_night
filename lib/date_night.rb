require 'pry'

require_relative 'node'

#make file BinarySearchTree., Make a date_night.rb
#whenever you're just reading @node, delete the @, you 
#have an attr_reader 
class BinarySearchTree
  attr_reader :node, :left, :right

  def initialize
    @node = nil
  end

  def insert(rating, title)
    if @node.nil? # delete @  #EXPLAIN ME WHY
      @node = Node.new(rating, title)  #keep @ #EXPLAIN ME WHY: b/c I don't have attr_accessor?
    else
      @node.insert(rating, title) # delete @ #EXPLAIN ME WHY
    end
    depth_of(rating)
  end
  
  def include?(rating)
    if rating == node.rating
      # return true
    else 
      node.include?(rating)
    end
  end
  
#  rating == node.rating ? ture: node.include?(rating)

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
#in_order_tree traversal
  def sort
    @sorted = []
    movie = {}
    @sorted << movie[@title] = @score
    current_node = node
    binding.pry

    if node.left.nil? && (sorted include?(node.rating) == false)
      movie = {node.title => node.rating}
      @sorted << movie
    else
      node.left.sort(current_node.rating, @sorted)
    end

    if node.right.nil? && (sorted include?(node.rating) == false)
      movie = {node.title => node.rating}
      @sorted << movie
    else
      node.right.sort(current_node.rating, @sorted)
    end
    return @sorted
  end


  def traverse
  end

#min, use min and max 


  def load(file)
    movies = File.open(file, 'r')
    movies_array = []
    movies.each_line do |line|
      line = line.chomp
      line = line.split(", ")
      pulled_rating = line[0].to_i
      pulled_title = line[1]
      binding.pry
      self.insert(pulled_rating, pulled_title)
      #self is implied already, you can delete
    end
  end


# private method extract
#self.insert(extract_rating, 

end


    # tree = BinarySearchTree.new
    # tree.insert(50, "Movie")
    # tree.insert(60, "Nice Movie")
    # tree.insert(20, "Crappy Movie")
    # tree.insert(99, "Fiddler on the Roof")