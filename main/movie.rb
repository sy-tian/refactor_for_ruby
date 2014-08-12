class Movie

  attr_accessor :title
  attr_accessor :price_code

  CHILDREN = 2
  REGULAR = 0
  NEW_RELEASE = 1

  def initialize title, price_code
    @title = title
    @price_code = price_code
  end

end