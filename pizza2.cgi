#! /usr/bin/env python3

print('Content-type: text/html\n')

import cgi

form = cgi.FieldStorage()

html = """<!doctype html>

<html>

<head><meta charset="utf-8">

<link rel="stylesheet" href="https://cgi.sice.indiana.edu/~dpierz/i211.css">

<title>PizzaNet Order</title></head>

<body>

  <h5>Your order: a {size} {crust} pizza, with {toppings}</h5>

  <h5>Total Cost: ${cost}</h5>
</body>

</html>"""

size = form.getfirst('size', 'massive')
crust = form.getfirst('crust', 'saltine')
toppings = form.getlist('toppings')
discount = form.getfirst('discount', 'none')
discount.upper()
cost = 0

if size == 'small':
    cost = 8.50
elif size == 'medium':
    cost = 10.50
elif size == 'large':
    cost = 12.50
else:
 size = 'massive'
 cost = 9.01

if len(toppings) > 0:
    cost += (len(toppings) * 2)
    toppings = str(toppings)[1:-1]
else:
    toppings = 'none'

if discount == 'PYTHON':
    cost = cost * .9
    cost = "{:.2f}".format(cost)

print(html.format(size = str(size), crust = str(crust), toppings = str(toppings), cost = str(cost)))
