class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'stand' , ->
      console.log 'standing'
      console.log @
      (@get 'dealerHand').dealerPlay()
    ,@ 
      # (@get 'dealerHand').dealerPlay()
 

 #if player stand value is true, then begin dealer play
   #how does the model listen to know when to begin
   # (@get 'playerHand').on 'stand' , ->
   #    (@get 'dealerHand').dealerPlay()

