# task

I used Provider as the state management tool.
I have not made this app using firebase I used local data and focused the UI I can add firestore and firebase if required.

The firebase integration will be similar to the one that I have done here : https://github.com/rudranshawasthi/chatroom/tree/master/Chatroom/lib/services

So I defined DemoData which contained all the passengers in the vicinity I also Implemented.
As I used all local data I used a map that contained all the fellow users in the vicinty with a number associated with them 
- 0 denotes the user is not connected  
- 1 denotes the user is connected
- 2 denotes the user has requested connection
- 3 denotes the user got request for connection

A passenger can only chat with another if the both have connected.
