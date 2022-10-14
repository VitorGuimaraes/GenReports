# Gen Reports

This project consists in a report generator, where a CSV file about orders from a restaurant is read and the follow metrics are calculated:

- Total profit earned by the restaurant.
- Profit earned from each customer.
- Quantity of orders for each dish from the menu.
- Quantity of orders made by each customer.
- Most popular dishes from the menu.
- Most frequently customer.

## The CSV file structure

The CSV file has the following columns:

| id |    order   | price |
|:--:|:----------:|:-----:|
|  1 |   pastel   |   3   |
|  2 | hambúrguer |   12  |
|  3 |   esfirra  |   9   |
|  4 |    sushi   |   15  |
|  5 |    pizza   |   21  |

The first column represents the customer ID.<br>
The second column represents the ordered dish.<br>
The third column represents the price of the order.

## Tasks

### Read the file

The file `report_complete.csv` have 300000 lines. Consider it when choose your strategy to read the file. You can use `Stream` module to handle this.

### Prepare the data

Ensure that you removed blank spaces, convert the `prices` to `Int` or `Float` and put the data into a better data struct to work with it.

### Documentation

Write documentation for your functions, modules and whatever you need.

### Tests

Write tests. Try to get the maximum coverage as you can.

### Write a parallel function

Create a parallel function to generate a report using the files `report_1.csv`, `report_2.csv` and `report_3.csv`
