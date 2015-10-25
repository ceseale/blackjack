class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @game.get('playerHand').hit()
    'click .stand-button': -> @game.get('playerHand').stand()

  initialize: ->
    @game = @model.get('game')
    @game.on 'playerAlert' , =>
      alert 'Player 1 Wins'
    @game.on 'dealerAlert' , =>
      alert 'Dealer Wins'
    @game.on 'pushAlert' , =>
      alert 'Push!'
    @game.on 'pushAlertBust' , =>
      alert 'Push! Dealer and Player busted'
    @game.on 'pBlackjack' , =>
      alert 'player has blackjack!'
    @game.on 'dBlackjack' , =>
      alert 'dealer has blackjack!'
    @game.on 'bothBlackjack' , =>
      alert 'dealer and player has blackjack'
    @render()
    @game.on 'gameover', ->
      @game = @model.get('game')
      @render()
    ,@  
  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @game.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @game.get 'dealerHand').el

