###################################

Environment:

Ruby - 2.1.5

###################################

Check the problem_statement.txt to know the context of the puzzle.

Command to run the code: 

1. Open this folder soes_puzzle_code_assignment in the terminal and execute the following

ruby process.rb

Eg: ruby process.rb data3.csv fancy_european_water extreme_fajita

###################################

Files:

1. process.rb - Stock order execution system is processed here
2. stock_exchange.rb - Input order is received here and processed
3. order.rb - An order is created
4. execute_order.rb - Executes the order

###################################

Logic: 

1. Input will be given in the console in this format
	Side | Company | Quantity
	Eg. Buy ABC 10
2. Validation like the transaction type whether 'Buy' or 'Sell' is validated. No Extensive validations performed.
3. If input is valid then an 'Order' instance is created by calling Order.new(input)
4. Then the order is processed for execution
5. In ExecuteOrder
	i)   There are two queues (1) sell_order_queue  (2) buy_order_queue
		  Each one to have will have the respective orders
	ii)  For the current order , we take the exisiting order of other side and perform the execution depending on the remaining quantity value. 
		  This is taken care by execute_order method
	iii) After execution we display the results

	
