class Product
  attr_reader :title, :price, :stock
  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    @@products.find { |product| product.title == title }
  end

  def in_stock?
    @stock > 0
  end

  def self.in_stock
    @@products.select { |product| product.in_stock? }
  end

  def deplete_stock count=1
    if @stock < count
      raise OutOfStockError, "#{self.title} doesn't have enough stock!"
    end
    @stock -= count
  end

  private

  def add_to_products
    if @@products.select { |product| product.title == @title }.size > 0
      raise DuplicateProductError, "'#{@title}' already exists."
    end
    @@products << self
  end
end
