require './order.rb'
require './execute_order.rb'

class StockExchange

  def submit_order
    print_info
    while true
      puts "\n"
      input = gets.chomp
      unless input == "exit"
        valid_input(input) ? process(input) : throw_error
      else
        break
      end
    end
  end

  def print_info
    puts "Hi This is a stock exchange."
    puts "Please place an order in this format: "
    puts "Side | Company | Quantity"
    puts "Example: Buy ABC 10"
    puts "If you want to leave . please enter 'exit'"
  end

  def valid_input input
    transaction_type = input.split(' ').first.capitalize
    transaction_type == Order::BUY || transaction_type == Order::SELL
  end

  def process input
    order = Order.new(input.split(' '))
    ExecuteOrder.new(order)
  end

  def throw_error
    puts "Invalid Input"
  end

end