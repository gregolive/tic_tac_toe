# TIC TAC TOE

Classic tic-tac-toe with customizable markers played between two players.

Live demo on [Replit](https://replit.com/@gregolive/Tic-Tac-Toe) 👈

## Functionality

A command version of the pen and pencil game tic tac toe made in Ruby. Players can choose a non-numeric marker to play as and place the marker by entering the corresponding number (1-9) on the game board.

## Reflection

Building this game was a nice introduction to classes in Ruby and displayed the benefits of untilizing this powerful feature of the language. Putting classes into practice this way helped me to netter understand how take adavntage of them as at first I struggled with the division of methods into classes, superclasses and modules.

At first I started by making a Player superclass with Player1 and Player2 subclasses, but then realized that the benefit of classes is being able to group all the player methods into one class. Another point of confusion was how much to include inside the Player class and what to keep outside of it. After first keeping the majority of the console outputs and some methods outside of the class, I realized it was cleaner with everything contained inside the class or an included module.

-Greg Olive