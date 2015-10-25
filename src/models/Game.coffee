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
    (@get 'dealerHand').on 'stand', ->
      dealerScores = (@get 'dealerHand').scores()
      playerScores = (@get 'playerHand').scores()
      if playerScores[0] is 21 and dealerScores[0] is 21
        @trigger 'bothBlackjack'
      else if playerScores[0] is 21
        @trigger 'pBlackjack'
      else if dealerScores[0] is 21
        @trigger 'dBlackjack'
      else if (@get 'dealerHand').busted and (@get 'playerHand').busted
        @trigger 'pushAlertBust'
      else if dealerScores[0] is playerScores[0]
        @trigger 'pushAlert'
      else if playerScores[0] > dealerScores[0] and not (@get 'playerHand').busted
        console.log 'hello'
        @trigger 'playerAlert'
      else if dealerScores[0] > playerScores[0] and not (@get 'dealerHand').busted 
        @trigger 'dealerAlert'
      else if not (@get 'playerHand').busted and (@get 'dealerHand').busted
        @trigger 'playerAlert'
      else if not (@get 'dealerHand').busted and (@get 'playerHand').busted
        @trigger 'dealerAlert'

      @trigger 'gameover'
    ,@  
 


