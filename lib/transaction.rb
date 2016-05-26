class Transaction
  attr_reader :customer, :product, :id

  @@transactions = []

  def initialize(customer, product, count = 1)
    @customer = customer
    @product = product
    @@transactions << self
    @id = @@transactions.index(self) + 1
    @product.stock -= count
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.each { |transaction| transaction if transaction.id == id }
  end
end
