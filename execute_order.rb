class ExecuteOrder

  attr_accessor :current_order, :queue_to_execute

  @@sell_order_queue = []
  @@buy_order_queue = []

  def initialize order
    @current_order = order
    @queue_to_execute = order.side == Order::BUY ? @@sell_order_queue : @@buy_order_queue
    perform
  end

  private

  def perform
    begin
      add_to_queue(current_order)
      execute_order
      display_results
    ensure
      @queue_to_execute = nil
    end
  end

  def add_to_queue order
    order.side == Order::BUY ? @@buy_order_queue << order : @@sell_order_queue << order
  end

  def execute_order
    list_of_orders = available_orders

    until current_order.remaining_qty == 0 || list_of_orders.empty?
      opp_side_order = list_of_orders.first

      if current_order.remaining_qty > opp_side_order.remaining_qty
        change_remaining_qty current_order, opp_side_order.remaining_qty
        change_remaining_qty opp_side_order
        list_of_orders.shift
      else
        change_remaining_qty opp_side_order, current_order.remaining_qty
        change_remaining_qty current_order
      end 

    end
  end

  def available_orders
    queue_to_execute.select{ |item| item.company == current_order.company and item.status == Order::OPEN and item.id < current_order.id } 
  end

  def change_remaining_qty order, value=nil
    value.nil? ? order.remaining_qty = 0 : order.remaining_qty -= value
    change_status_to_close order if order.remaining_qty == 0
  end

  def change_status_to_close order
    order.status = Order::CLOSED
  end

  def display_results
    all_orders = @@sell_order_queue + @@buy_order_queue
    all_orders.sort_by! { |order| order.id }
    all_orders.each do |order|
      display order
    end
  end

  def display(item)
    puts "\n"
    puts "#{item.id} | #{item.side} | #{item.company} | #{item.quantity} | #{item.remaining_qty} | #{item.status}"
  end

end