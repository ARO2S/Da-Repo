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

  <h3>What do you want on your {size} pizza with {crust} crust? Each topping is $2 extra.</h3>

<form method='post' action="pizza2.cgi">
  <input type="checkbox" id="topping1" name="toppings" value="pepperoni">
  <label for="topping1"> pepperoni </label><br>

  <input type="checkbox" id="topping2" name="toppings" value="mushroom">
  <label for="topping2"> mushroom</label><br>

  <input type="checkbox" id="topping3" name="toppings" value="onion">
  <label for="vehicle3"> onion</label><br>

  <input type="checkbox" id="topping4" name="toppings" value="bell pepper">
  <label for="topping4"> bell pepper</label><br>

  <input type="checkbox" id="topping5" name="toppings" value="extra cheese">
  <label for="topping5"> extra cheese</label><br><br>

  <h5> Enter discount code here: </h5>
  <input type='text' name='discount'><br>
  <input type='hidden' name='size' value='{size}'>
  <input type='hidden' name='crust' value='{crust}'>
  <br>
  <button type="submit">Next</button>
</form>

</body>

</html>"""

size = form.getfirst('size', 'massive')
crust = form.getfirst('crust', 'saltine')
# if size == 'a':
#     size = 'small'
# elif size == 'b':
#     size = 'medium'
# elif size == 'c':
#     size = 'large'
# else:
#     size = 'massive'

print(html.format(size = str(size), crust = str(crust)))
