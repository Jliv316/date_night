require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_search_tree'
require_relative '../lib/node'

class BinarySearchTreeTest < MiniTest::Test

  def setup
    @tree = BinarySearchTree.new
  end

  def test_it_exists
    binary_search_tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, binary_search_tree
  end

  def test_node_creation
    tree = BinarySearchTree.new
    new_node = @tree.create_node(55, "test")
    assert_equal 55, new_node.rating
  end

  def test_node_insert
    new_node = Node.new(55, "test")
    old_node = Node.new(20, "Forest Gump")
    @tree.insert_node(new_node, old_node)
    assert_equal 55, old_node.right.rating

  end

  def test_it_can_search_successfully
    @tree.create_node(55, "test1")
    @tree.create_node(20, "test2")
    @tree.create_node(70, "test3")
    @tree.create_node(10, "test4")
    node = @tree.first_search(55)

    assert_equal 55, node.rating
  end

  def test_include?
    @tree.create_node(55, "test1")
    @tree.create_node(20, "test2")
    @tree.create_node(70, "test3")
    @tree.create_node(10, "test4")

    assert_equal true, @tree.include?(55)
  end

  def test_node_depth
    @tree.create_node(55, "test1")
    @tree.create_node(20, "test2")
    @tree.create_node(70, "test3")
    @tree.create_node(10, "test4")

    assert_equal 2, @tree.node_depth(55)
  end

  def test_it_can_sort
    @tree.create_node(55, "test1")
    @tree.create_node(20, "test2")
    @tree.create_node(70, "test3")
    @tree.create_node(10, "test4")
    @tree.sort
    test_it = sorted_movies[0][:rating]

    assert_equal 0, test_it
  end

  def test_min
    @tree.create_node(55, "test1")
    @tree.create_node(20, "test2")
    @tree.create_node(70, "test3")
    @tree.create_node(10, "test4")
    min_node = @tree.min


    assert_equal 10, min_node.rating
  end

  def test_max
    @tree.create_node(55, "test1")
    @tree.create_node(20, "test2")
    @tree.create_node(70, "test3")
    @tree.create_node(10, "test4")
    max = @tree.max.rating
    assert_equal 70, max
  end

  def health
    @tree.create_node(71, "test1")
    @tree.create_node(80, "test2")
    @tree.create_node(17, "test3")
    @tree.create_node(55, "test4")

    assert_equal []
  end



end
