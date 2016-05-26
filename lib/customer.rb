class Customer
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    @purchase_count = 0
    @money_spent = 0
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.each  { |customer| return customer if customer.name == name }
  end

  def purchase(product, count = 1)
    if product.stock == 0
      raise OutOfStockError, "'#{product.title}' is out of stock."
    end
    Transaction.new(@customer, product)
    @purchase_count += 1
    @money_spent += product.price * count
  end

  def total_purchases
    puts "#{@name} has made #{@purchase_count} purchases and spent $#{@money_spent}."
  end

  private

  def add_to_customers
    if @@customers.map { |customer| customer.name }.include?(@name)
      raise DuplicateCustomerError, "'#{@name}' already exists."
    end
    @@customers << self
  end
end
