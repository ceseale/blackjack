# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    #sets up the deck
    #sets the same deck for both

    @set 'game', game = new Game()

    #will need to capture the hand comparison mechanism
