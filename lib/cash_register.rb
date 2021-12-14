
class CashRegister

  attr_accessor :total, :discount, :last_transaction, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    if quantity == 1
      self.items.push(title)
    else
      quantity.times {self.items.push(title)}
    end

    self.last_transaction = price * quantity
    self.total += self.last_transaction
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      d2 = self.discount * 0.01
      self.total -= (d2 * self.total)
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total -= last_transaction
  end


end

laura = CashRegister.new(20)