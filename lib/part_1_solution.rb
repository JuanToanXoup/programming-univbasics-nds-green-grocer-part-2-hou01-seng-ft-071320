require 'pry'
def find_item_by_name_in_collection(name, collection)
  index = 0

  collection.each do |grocery_item|
    return grocery_item if grocery_item[:item] === name
    index += 1
  end

  nil
end

=begin
def consolidate_cart(cart)
  index = 0
  new_cart = []

  cart.each do |grocery_item|
    current_item = find_item_by_name_in_collection(grocery_item[:item], new_cart)
    if current_item
      new_cart_index = 0
      new_cart.each do |new_cart_item|
        if current_item[:count] > 1
          new_cart_item[:count] = current_item[:count]
        end
        new_cart_index += 1
      end
    else
      grocery_item[:count] = 1
      new_cart << grocery_item
    end
    index += 1
  end
  new_cart
end
=end
unconsolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "KALE",    :price => 3.00, :clearance => false},
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}
]

def consolidate_cart(cart)
  cart_with_count = cart.each_with_object([]) do |index,cart_array|
    if index.has_key? :count
        cart_array << index
    else
    index[:count] = 1
    cart_array << index
    end
  end
  full_cart = cart_with_count.each_with_object([]) do |index2,final_cart|
    final_cart.each do |new_index|
      if !new_index[:item].include?(index2[:item])
        final_cart << index2
        binding.pry
      else
        index2[:count] += index2[:count]
      end
    end
  end
  full_cart
  binding.pry
end
binding.pry
