focus on: TDD
* using tests to drive the code
* red - green - refactor
* breaking the problem down into the smallest next piece
* "How do I want to interact with this code?"
* You can think of new tests along the way!

Some things about the solution, probably...
* denominations
* coins
* bills
* some way to deal with rounding errors (is that a thing in ruby?)
* am I going to deal with pluralization? HOW
* what denominations are in my cash drawer?! is there a situation where I don't have any dimes?????



Hypothesis: I am going to have trouble with rounding if I represent pennies as .01

Test with IRB: start at 1, subtract .01 repeatedly - I think eventually I'll get stupid numbers

Ways to deal?:
1. unit is 1 cent - 1 dollar is 100
2. bigdecimal - "deal with money rounding ruby"

Hypothesis:
1. Using bigdecimal will allow me to not have stupid numbers
2. I know enough to use BigDecimal

Experiment with IRB: same as before, but use BigDecimal

to follow up on later: is .to_f a reasonable way to display the answer?