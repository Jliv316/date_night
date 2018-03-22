class Node
  attr_reader   :name, :rating
  attr_accessor :right, :left, :depth
# each node knows the data that it holds and its children
#
  def initialize(rating, name)
    @rating = rating
    @name = name
    @depth = 0
  end

end
