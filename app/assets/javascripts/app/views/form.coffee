define [
  'base'
], (
  Base
) ->

  class Form extends Base.ListView

    inputs:
      name:
        type: 'Text'
        placeholder: 'Name your album'
        validate: ['required']
      email:
        type: 'Text'
        value: 'some value'
        label: 'Email'
        placeholder: 'some placeholder'
        id: 'share-email'
        class: 'big-input'
        validate: ['email', 'required']
        options:
          infinite: true

    createInputs: ->
      if @inputs
        @inputs
