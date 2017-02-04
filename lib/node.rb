class Node
 attr_accessor :rating, :title, :left, :right, :depth
  def initialize(rating, title, depth = 0)
    @rating = rating
    @title = title
    @left = nil
    @right = nil
    @depth = depth
  end

  def insert(compare_rating, new_title)
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

#insert
#you're doing the same thing over and over
#do it once, then call it on left and right.insert_node

private

def insert_node()
  node

end



  def include?(compare_rating)
    return true if compare_rating == rating
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

#extract into private method
#patterns - make them



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

  def sort(compare_rating, sorted)
    if compare_rating < rating
      @sorted = []
      if left.nil? && sorted.include?(self.rating) == false
        movie = {self.title => self.rating}
        @sorted << movie
      else
        @left.sort(compare_rating, @sorted)
      end
    else
      if right.nil? && sorted.include?(self.rating) == false
        movie = {self.title => self.rating}
        @sorted << movie
      else 
        @right.sort(compare_rating, @sorted)
      end
    end
    return @sorted
  end
  
  #delete and restart

end

# tree = BinarySearchTree.new
# tree.insert(50, "Movie")
# tree.insert(60, "Nice Movie")
# tree.insert(40, "Bad Movie")
# tree.insert(70, "Very Nice Movie")

# tree = BinarySearchTree.new

# binding.pry