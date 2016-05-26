class Product
  attr_reader :title, :price
  attr_accessor :stock
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
    @@products.each do |product|
      if product.title == title
        return product
      end
    end
  end

  def in_stock?
    @stock > 0
  end

  def self.in_stock
    @@products.select { |product| product.in_stock? }
  end

  private

  def add_to_products
    if @@products.select { |product| product.title == @title }.size > 0
      raise DuplicateProductError, "'#{@title}' already exists."
    else
      @@products << self
    end
  end


end
