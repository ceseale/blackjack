
# assert = chai.assert

# describe "blackjack", ->

    # deck = new Deck()
    # PlayerHand = deck.dealPlayer()
    # DealerHand = deck.dealDealer()

  # it "should know when player is busted", ->

    PlayerHand.hit()
    PlayerHand.hit()
    PlayerHand.hit()
    PlayerHand.hit()
    PlayerHand.hit()
    PlayerHand.hit()
    console.log(PlayerHand.get('scores')());
    if PlayerHand.scores[0] > 21
      console.log ('bust');
    

# 1 - player
#should know when you busted
#should know when you hit 21
#should signal you've decided to stand 

# 2 - dealer
#should respond to user after the stand
#should hit until seventeen or greater
#should offer you to play again
#should know when you busted

# 3 - player vs dealer
#should know what a push (aka tie w/ dealer and player)
  #you don't lose money
  #edge case with blackjack? i think it's player still wins
#should know who won
#should know what to do if both hit 21
