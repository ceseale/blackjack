class window.Deck extends Backbone.Collection
  model: Card

  #sorts the deck and gives them a card with a rank and suit
  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  #takes the last two cards
  dealPlayer: -> new Hand [@pop(), @pop()], @
  #takes the last two cards, flips one
  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

