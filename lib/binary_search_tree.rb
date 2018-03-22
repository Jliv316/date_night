require 'pry'
require_relative 'node'
class BinarySearchTree
  attr_reader :root_node

  def initialize
    @root_node = Node.new(nil,"")
  end


  def data_insertion
    movies = []
    unformatted_movies = []
    file='movies.txt'

    f = File.open(file, "r")
    f.each_line do |movie|
      unformatted_movies << movie.split(":")
    end
    f.close

    unformatted_movies.each do |movie|
    movies << [movie[0].to_i, movie[1].delete("\n")]
    end
    movies.each do |movie|
      create_node(movie[0],movie[1])
    end
    #creates and stores movies rating and name into nodes as a hash
    # movies.each do |movie|
    #   movies_hash << {:rating => movie[0], :name => movie[1]}
    # end
    # movies_hash.each do |movie|
    #   create_node(movie[:rating], movie [:name])
    # end
  end


  def create_node(rating, name)
    new_node = Node.new(rating, name)
    #create new node
    if @root_node.rating == nil
       @root_node = new_node
    else
      insert_node(new_node, @root_node)
    #insert_node(new_node, @root_node
    end
  end




  def insert_node(new_node, old_node)
    new_node.depth += 1
      if new_node.rating < old_node.rating
        return insert_node(new_node, old_node.left) unless old_node.left.nil?
        return old_node.left = new_node
      elsif new_node.rating > old_node.rating
        return insert_node(new_node, old_node.right) unless old_node.right.nil?
        return old_node.right = new_node
      end
  end


# input rating you are looking to find... which correspods to a node... search tree for that rating recursively, by replacing

  def first_search(rating)
      if rating == @root_node.rating
        return @root_node
    elsif rating < @root_node.rating
       node = @root_node.left
       search(node, rating)
    elsif rating > @root_node.rating
       node = @root_node.right
       search(node, rating)
    end
  end


  def search(node, rating)
    if node.rating == rating
       return node
       p node
    elsif rating < node.rating
      search(node.left, rating)
    elsif rating > node.rating
      search(node.right, rating)
    end
  end

  def include?(rating)
    node = first_search(rating)
    if node.rating == rating
      p true
    else
      p false
    end
  end

  def node_depth(rating)
    node = first_search(rating)
    p node.depth
  end

  def sort
    if @root_node != nil
      finish_sort(@root_node)
    end
  end

    def finish_sort(node)
      sorted_movies = []
      return sorted_movies if node == nil
      finish_sort(node.left) +
      (sorted_movies << {rating: node.rating, name: node.name, depth: node.depth }) +
      finish_sort(node.right)
    end


    def min
      if @root_node != nil
        finish_min(@root_node)
      end
    end

    def finish_min(node)
      if node.left.nil?
         min_node = node
         return min_node
       else
         finish_min(node.left)
       end
    end

    def max
      if @root_node != nil
        finish_max(@root_node)
      end
    end

    def finish_max(node)
      if node.right.nil?
         max_node = node
         return max_node
      else
         finish_max(node.right)
      end
    end

  def health(depth)
    movies_matching_depth = []
    sorted_movies = sort
    total_nodes = sorted_movies.length
    sorted_movies.each do |movie|
      if movie[:depth] == depth
        movies_matching_depth << movie
      end
    end
    health_at_depth = movies_matching_depth.map do |node|
      first_node = first_search(node[:rating])
      number_of_children = finish_sort(first_node).length
      [node[:rating], (number_of_children + 1), ((((number_of_children + 1).to_f) / (total_nodes.to_f)) * 100).floor.to_i]
    end
  end

end

# tree = BinarySearchTree.new
# tree.data_insertion
# rating = 55
# tree.first_search(rating)
# # tree.include?(18)
# tree.node_depth(39)
# # root_node = tree.check_root
# tree.min
# tree.max
# tree.sort
# binding.pry
