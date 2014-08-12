require '../main/movie'
require '../main/rental'
class Customer
  attr_accessor :name
  attr_accessor :rental_list

  def initialize(name)
    @name = name
    @rental_list = []
  end

  def addRental arg
    @rental_list.push(arg)

  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = 'Rental Record for ' + @name + "\n"
    @rental_list.each do |each|
      this_amount = 0
      case each.movie.price_code
        when Movie::REGULAR
          this_amount += 2
          if each.days_rented > 2
            this_amount += (each.days_rented - 2) * 1.5
          end
        when Movie::NEW_RELEASE
          this_amount += each.days_rented * 3.0
        else
          this_amount += 1.5
          if each.days_rented > 3
            this_amount += (each.days_rented - 3) * 1.5
          end
      end
      #add frequent renter points
      frequent_renter_points += 1
      #add bonus for a two da new release rental
      if each.movie.price_code == Movie::NEW_RELEASE && each.days_rented > 1
        frequent_renter_points += 1
      end
      #show figures for this rental
      result += "\t" + each.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end
    #add footer lines
    result += 'Amount owed is ' + total_amount.to_s + "\n"
    result += 'You earned '  + frequent_renter_points.to_s + ' frequent renter points'
    return result
  end
end