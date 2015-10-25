class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(busted){ %>bust<% }else{ %>not bust<% } %> (<span class="score"></span>)</h2>'
  
  standTemplate: _.template '<h2>STAND (<span class="score"></span>)</h2>';

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'bust', => @render()
    @collection.on 'stand', => 
      @standRender()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]

  standRender: ->
    @$el.children().detach()
    @$el.html @standTemplate @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]

