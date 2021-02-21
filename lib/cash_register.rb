require "pry"

class CashRegister
    attr_accessor :discount, :total, :items, :transaction #@transaction doesn't need to be initialized below because it is just a mthod to change and call on

    def initialize(discount = 0) #default discount as optional to 0
        @total = 0 #total = 0
        @discount = discount
        @items = [] #make an item empty array

    end
  
    def add_item(item, price, quantity=1) #takes 3 arguments, item and price(as requested in first part) and then the quanity which is automatically set to 1

        self.total += price * quantity #sets the price x whatever the quantity is and add to the total quantity, whatever is on the right GETS ASSIGNED to the left


        quantity.times {self.items << item} #since quantity is at 1, if multiple items are there we must times the item scanned if more than 1, so .times. Then in the bracks, push the items into the self.item method
      
        self.transaction = [item,price,quantity] #the transaction is going to include the item, price and quantity (like a receipt)

        #binding.pry
        
    end
    
    def apply_discount

        if self.discount > 0 #if the discount is greater than 0
            self.total -= (self.total * self.discount.fdiv(100)) # get the total with the applied discount
        "After the discount, the total comes to " + "$" + self.total.to_s.sub(/\.?0+$/, '') + "." #puts out string

        else 
            "There is no discount to apply." #else, puts out error string
        #binding.pry
        end
    end

    def void_last_transaction

        self.total -= self.transaction[1] * self.transaction[2] #subtracts the last price and quantity in a transaction, transaction [1] (price) * trsansaction[2] (quantity)
    end
end

=begin 
- Start with class of Cash Register
    - attr_accessor containing the discount and total to be accessed throughout
    - make an accessor for the items and the transactions made
- initialize method for the total
    - total default to 0
    - discount for employees is 0 (defaulted but can be changed)
- add_item method, takes in 2 arguments of title and price and can increase the total
      - add a 3rd argument, that is the quantity
      - the total will then = the price * quantity 
      - withint his method, we will add items into an array to display
        - items attribute will take in the items, *the quantity (almost liek a receipt
      - within this method, we will also add the transaction (almost like a receipt)
        - take transaction attribute and add the item, price and quantity within it
- void last transaction method needs to remove the last transaction
    - the total will subtract and equal the last transaction attribute
        - since we need to remove the item price we will take the transaction price by index and times it by the transaction quantity by index
        - this will result in being able to remove the last transactiona nd update the total
=end