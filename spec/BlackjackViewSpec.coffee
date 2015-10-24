
# assert = chai.assert

# describe "blackjack", ->

assert = chai.assert

describe "player", ->

  # it "should know when player is busted", ->
  it "testing for player bust", ->
    collection = new Deck()
    hand = collection.dealPlayer()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()

    assert.strictEqual hand.busted, true

  it "testing for player not bust", ->
    collection = new Deck()
    hand = collection.dealPlayer()
    assert.strictEqual hand.busted, false
    

# 1 - player
#should know when you hit 21
  #announce blackjack - similar to bust
#should signal you've decided to stand 


# 2 - dealer
#should respond to user after the stand
  #happen inside of the game, and will pull the property from the player to say they decided to stand
  #dealer will know to move forward
#should hit until seventeen or greater
  #put this inside of the hand and say if dealer, then hit according to strategy
#should offer you to play again
  #inside of the app model because you can control the games
#should know when you busted
  #DONE

# 3 - player vs dealer
#should know what a push (aka tie w/ dealer and player)
  #put inside of game model to know the tie
  #should know what to do if both hit 21
#should know who won
  #inside of game model to know who won, get dealer and player score and compare
#declare blackjack - put the logic inside of the hand

#goal
 #casino chips
 #maybe look nice, maybe different
