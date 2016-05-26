class Transaction
  attr_reader :customer, :product, :id

  @@transactions = []

  def initialize(customer, product)
    @customer = customer
    @product = product
    @@transactions << self
    @id = @@transactions.index(self) + 1
    @product.stock -= 1
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.each do |transaction|
      if transaction.id == id
        return transaction
      end
    end
  end


end
