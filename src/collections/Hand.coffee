class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  #you get another card to your hand
  #adds to the colleciton of the hand (from deck to hand)
  # returns the last Card
  hit: ->
    @add(@deck.pop())
    if @isBust()
      @busted = true
      @trigger 'bust', @
    @last()
  
  #test for the ace card - that's it
  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  #show your minimum score if th card is revealed(if it's not, dont' show it)
  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  # gives you a score - if you have an ace, show the alternate score 
  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]
  #stand
  #should implement a stand component 
  isBust: ->
    if @scores()[0] > 21
      true
    else
      false

  busted: false

