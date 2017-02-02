require 'pry'
require 'minitest/autorun'
require './lib/date_night'
require 'minitest/pride'
require './lib/node'


class DateNightTest < Minitest::Test
  def setup
    @tree = BinarySearchTree.new
    @tree.insert(50, "Movie")
    @tree.insert(60, "Nice Movie")
    @tree.insert(20, "Crappy Movie")
    @tree.insert(99, "Fiddler on the Roof")
  end

  def test_this_should_fail
    skip
    refute true, "Metatest, this should fail"
  end


#Node Tests

  def test_if_node_exists
    assert node = Node.new(50, "Movie")
  end

  def test_if_node_has_title
    node = Node.new(50, "Movie")
    assert_equal "Movie", node.title
  end

  def test_if_node_has_rating
    node = Node.new(50, "Movie")
    assert_equal node.rating, 50
  end

  def test_if_node_has_left_child
    node = Node.new(50, "Movie")
    node.left = Node.new(20, "Crappy Movie")
    assert node.left
  end

  def test_if_node_has_right_child
    node = Node.new(50, "Movie")
    node.right = Node.new(60, "Nice Movie")
    assert node.right
  end



#BinarySearchTree Tests

  def test_does_BinarySearchTree_exist
    assert @tree
  end

  def test_insert_root_node
    assert_equal 50, @tree.node.rating 
    assert_equal "Movie", @tree.node.title 
  end

  def test_insert_nodes
    tree = BinarySearchTree.new
    tree.insert(50, "Movie")
    tree.insert(60, "Nice Movie")
    assert_equal 60, tree.node.right.rating 
    assert_equal "Nice Movie", tree.node.right.title 
  end

  def test_include?
    assert @tree.include?(50)
    assert @tree.include?(60)
  end

  def test_depth_of
    assert_equal 0, @tree.depth_of(50)
    assert_equal 1, @tree.depth_of(60)
    assert_equal 2, @tree.depth_of(99)
  end


  def test_max
    assert_equal ({"Fiddler on the Roof" =>99}), @tree.max
  end

  def test_min
    assert_equal ({"Fiddler on the Roof" =>99}), @tree.max
  end


  def test_load
    tree = BinarySearchTree.new
    tree.load("./lib/movies.txt")
    assert_equal  ({"The Little Engine That Could" => 100}), tree.max
    assert_equal  ({"Cruel Intentions" => 0}), tree.min
  end

  def test_sort
    tree = BinarySearchTree.new
    tree.insert(50, "Movie")
    tree.insert(60, "Nice Movie")
    tree.insert(20, "Crappy Movie")
    tree.insert(99, "Fiddler on the Roof")
    tree_sorted = tree.sort
    assert_equal  [{"Crappy Movie" =>20},
   {"Moview"=>50},
   {"Nice Movie"=>60},
  {"Fiddler on the Roof"=>99}], tree_sorted
  end

  def test_health
  end


  #extensions

  def test_is_leaf?
    assert @tree.node.right.right.is_leaf?
    refute @tree.node.right.is_leaf?
  end

  def test_leaves
  end

  def test_height
  end

  def test_delete_node
  end

end


    #would it be helpful to use assert_instance_of?
    #assert_instance_of String, 'foo'