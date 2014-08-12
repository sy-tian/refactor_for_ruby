class Rental
  attr_accessor :days_rented
  attr_accessor :movie


  def initialize movie, days_rented
    @movie = movie
    @days_rented = days_rented
  end
end