### Welcome to the Seta Workshop Wordle API

First of all, thanks a lot for taking the time to do this, we really appreciate it! 🙂

In this opportunity, we are going to build a simplified version of the WORDLE game.

For those who don't know the game, it consists in guessing a single word. Every day the application chooses a different word from the dictionary and the user must guess it in 6 tries or less. You can get more info in https://en.wikipedia.org/wiki/Wordle

We will try to do something similar. To do so, we are going to follow these rules:
  - The application chooses a single word every day (so you could say the application creates one game per day)
  - If the user has not started a game today, the application will create a new one for him.
  - If the user has started a game previously today, the application will not create a new one but rather use the existing one.
  - The application must return to the user which letters are present or not in the word, and which ones are in the correct position.
  - If the user gets the word in 6 guesses or less, he wins, and the game ends. If the user can't guess the word, he losses, and the game ends as well.

In order to achive this we will create 2 endpoints.

The first endpoint will be used to start a user's game. The response must return all the words the user has tried so far as well (if any), and remember, if the user has already started a game today, it will not create a new one, but return the existing one.

The second endpoint has to receive a word, save it in the users' game, and return if it is correct or not, and the which letters are correct (example shown below). If the game has ended and the user wants to try with another word, the application has to return a message explaining he has won/lost the game already.

We are going to just play with a reduced amount of 5 letter words: LIBRE, GATOS, JORGE. Make the application to pick one randomly when a game has to be created.

Every action in the controller can/will receive the user ID in order to play (to associate him to a game). Create a user and use his ID. The User model and migration is provided already.

We are asking:
  - Fork the project and share it with the following Github user: Sebamax91 (Sebastian)
  - Create the two endpoints listed above, and every model, migration, class, etc., that you think necessary to make this game work as described
  - Create a new branch with your solution and submit a PR for Sebastian to be notified (email him as well, please 🙂)

Let's say the word of the day is "GATOS" and the user enters "OTRAS", the response of the second endpoint should return (among other data you might send):

```JSON
{
  "0": "amarillo", "1": "amarillo", "2": "rojo", "3": "amarillo", "4": "verde",
}
```

**NOTE: Bear in mind that there is no right or wrong way to do this (if the concepts are in place and there is a proper justification)**

**NOTE 2: This API responds in JSON format, so the controller actions should return a JSON response**

**MOST OF THE DECISIONS ARE UP TO YOU, EVERYTHING YOU WANT TO ADD, IMPROVE, OR CHANGE IS ALLOWED, JUST SHOW OFF HOW MUCH YOU KNOW!**
