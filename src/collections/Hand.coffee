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
      if @standing is false
        console.log 2
        @stand()
    @last()
  
  #test for the ace card - that's it
  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  #show your minimum score if th card is revealed(if it's not, dont' show it)
  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  dealerMinScore: -> @reduce (score, card) ->
    score + card.get 'value'
  , 0

  # gives you a score - if you have an ace, show the alternate score 
  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  # dealerSecretScores: ->
  #   # The scores are an array of potential scores.
  #   # Usually, that array contains one element. That is the only score.
  #   # when there is an ace, it offers you two scores - the original score, and score + 10.
  #   [@dealerMinScore(), @dealerMinScore() + 10 * @hasAce()]  
  #stand
  #should implement a stand component 
  isBust: ->
    if @scores()[0] > 21
      true
    else
      false

  busted: false

  stand: ->
    @standing = true
    @trigger 'stand'

  standing: false

  dealerPlay: ->
    if @at(0).get('revealed') is false
      @at(0).flip()

    if @scores()[0] < 17
      @hit()
      @dealerPlay()
    else if @scores()[1] is 21
      @stand()
    else if not @standing
      @stand()
    #if score is less than 17, hit
    #if score is >= 17, then stand
