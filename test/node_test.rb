
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node' #if in same directory use "."

class NodeTest < MiniTest::Test
  #states: name, rating, children

  def setup
    @node = node.new()
  end

#make test that class Node exists
  def test_it_exists
    assert_instance_of Node, @node
  end

end
