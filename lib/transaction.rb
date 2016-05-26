class Transaction
  attr_reader :customer, :product, :id

  @@transactions = []

  def initialize(customer, product, count = 1)
    @customer = customer
    @product = product
    add_to_transactions
    @id = @@transactions.index(self) + 1
    @product.stock -= count
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find { |transaction| transaction.id == id }
  end

  def add_to_transactions
    if product.stock == 0
      raise OutOfStockError, "'#{product.title}' is out of stock."
    end
    @@transactions << self
  end
end
