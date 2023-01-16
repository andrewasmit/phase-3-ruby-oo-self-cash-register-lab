require 'pry'
class CashRegister
    attr_accessor :total, :trans_arr, :item_arr
    attr_reader :discount

    def initialize(discount=0)
        @discount=discount
        @total = 0
        @trans_arr=[0]
        @item_arr=[]
    end

    def add_item(title, price, quantity = 1)
        sub_total = @total = @total + (price * quantity)
        @trans_arr << sub_total
        i=0
        while i<quantity do
            item_arr << title
            i+=1
        end
        sub_total
    end

    def apply_discount
        # binding.pry
        if @discount == 0
            "There is no discount to apply."
        else
        # binding.pry
        @total = @total.to_f - (@total.to_f * (@discount.to_f/100))
        @total = @total.to_i
        "After the discount, the total comes to $#{total}."
        end
    end

    def items
        item_arr
    end

    def void_last_transaction
        @trans_arr.pop 
        @total = trans_arr[-1]
        @total 
    end

end