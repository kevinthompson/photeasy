define ['base'], (Base) ->
  class PillInput extends Base.ItemView

    id: 'pills'

    pills: new Base.Collection

    events:
      'click': 'handleEl'
      'click input': 'handleClick'
      'focus input': 'handleFocus'
      'blur input': 'handleBlur'

    handleEl: ->
      $template = @inputTemplate()
      @$el.append @inputTemplate()

    handleClick: (event) ->
      $input = $(event.target)
      $input.addClass 'selected'
      $input.one 'keyup', =>
        $input
          .removeClass('pilled')
          .val('')


    handleInput: ->

    inputTemplate: ->
      $("<input type=\"#{@inputType}\"/>")
