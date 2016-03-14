class Order

  attr_accessor :id, :side, :company, :quantity, :remaining_qty, :status

  OPEN = "Open"
  CLOSED = "Closed"
  BUY = "Buy"
  SELL = "Sell"

  @@count = 0

  def initialize args
    @id = @@count += 1
    @side = args[0].capitalize
    @company = args[1].upcase
    @quantity = args[2].to_i
    @remaining_qty = args[2].to_i
    @status = OPEN
  end

end