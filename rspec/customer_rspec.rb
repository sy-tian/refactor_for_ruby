require '../main/customer'
require '../main/movie'
describe Customer do


  before do
    (:all)
    @dinsdale = Customer.new 'Dinsdale Pirhana'
    @python = Movie.new 'Monty Python and the Holy Grail', Movie::REGULAR
    @ran = Movie.new('Ran', Movie::REGULAR)
    @la = Movie.new('LA Confidential', Movie::NEW_RELEASE)
    @trek = Movie.new('Star Trek 13.2', Movie::NEW_RELEASE)
    @wallace = Movie.new('Wallace and Gromit', Movie::CHILDREN)
    @dinsdale.addRental Rental.new @python, 3
    @dinsdale.addRental Rental.new @ran, 1
    @dinsdale.addRental Rental.new @la, 2
    @dinsdale.addRental Rental.new @trek, 1
    @dinsdale.addRental Rental.new @wallace, 6

  end

  def verify_output(actual_value, file_name)
    file = File.open(file_name, 'r')
    actual_value = actual_value.split("\n")
    if (file.size != 0)
      file.each_line do |line|
        expect(line).to eq actual_value.each do |line_for_actual|
          line_for_actual
        end
      end
    end
  end

  it 'should_output_empty_statement' do
    customer = Customer.new 'Golden Shark'
    verify_output(customer.statement(), 'outputEmpty')
  end

  it 'should_output_changed_statement' do
    verify_output(@dinsdale.statement, 'output1')
  end
end