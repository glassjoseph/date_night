require 'pry'
require 'minitest/autorun'
require './lib/date_night'
require 'minitest/pride'



class DateNightTest < Minitest::Test

  def test_this_should_fail
    skip
    refute true, "Metatest, this should fail"
  end

  def test_if_node_exists
    assert node = Node.new(50, "Shrek")
  end

  def test_if_node_has_title
    node = Node.new(50, "Shrek")
    assert_equal "Shrek", node.title
  end

  def test_if_node_has_rating
    node = Node.new(50, "Shrek")
    assert_equal node.rating, 50
  end

  def test_if_node_has_left
    node = Node.new(50, "Shrek")
    assert_nil node.left
  end

  def test_if_node_has_right
    node = Node.new(50, "Shrek")
    assert_nil node.right
  end


  def test_does_BinarySearchTree_exist
    tree = BinarySearchTree.new
    assert tree
  end


  def test_insert_root_node
    tree = BinarySearchTree.new
    tree.insert(50, "Movie")
    assert_equal 50, tree.node.rating 
    assert_equal "Movie", tree.node.title 
  end

  def test_insert_nodes
    tree = BinarySearchTree.new
    tree.insert(50, "Movie")
    tree.insert(60, "Nice Movie")
    assert_equal 60, tree.node.right.rating 
    assert_equal "Nice Movie", tree.node.right.title 
  end

  def test_include?
    tree = BinarySearchTree.new
    tree.insert(50, "Movie")
    tree.insert(60, "Nice Movie")
    assert tree.include?(50)
    assert tree.include?(60)
  end

  def test_depth_of
    tree = BinarySearchTree.new
    tree.insert(50, "Movie")
    tree.insert(60, "Nice Movie")
    assert_equal 1, tree.depth_of(60)
  end


  def test_max
    tree = BinarySearchTree.new
    tree.insert(50, "Movie")
    tree.insert(60, "Nice Movie")
    tree.insert(20, "Crappy Movie")
    tree.insert(99, "Fiddler on the Roof")

    assert_equal ({"Fiddler on the Roof" =>99}), tree.max
  end

  def test_min
    tree = BinarySearchTree.new
    tree.insert(50, "Movie")
    tree.insert(60, "Nice Movie")
    tree.insert(20, "Crappy Movie")
    tree.insert(99, "Fiddler on the Roof")
    assert_equal ({"Fiddler on the Roof" =>99}), tree.max

  end


  def test_sort
  end

  def test_load
    tree = BinarySearchTree.new
    tree.load("./lib/movies.txt")
    assert_equal  ({"The Little Engine That Could" => 100}), tree.max
    assert_equal  ({"Cruel Intentions" => 0}), tree.min
  end

  def test_health
  end


  #extensions

  def test_is_leaf?
    tree = BinarySearchTree.new
    tree.insert(50, "Movie")
    tree.insert(60, "Nice Movie")
    #this will test tree, not node 
    assert tree.node.right.is_leaf?
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