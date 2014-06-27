setToken = (xhr, settings) ->
  token = $('meta[name="csrf-token"]').attr('content')
  xhr.setRequestHeader('X-CSRF-Token', token)

$.extend($.ajaxSettings, {beforeSend: setToken})

class EventDelegator
  constructor: (@klass) ->
    for [selector, event, action] in @klass.events
      $(selector).on event, @klass[action]

class ArticleEditor
  events: [
    ['.editable', 'input', 'saveField']
  ]

  constructor: ->
    new MediumEditor('.editable.no-toolbar', {disableReturn: true, disableToolbar: true})
    new MediumEditor('.editable.with-toolbar')
    new EventDelegator(this)

  saveField: ->
    this.updater ?= new UpdateField($(this))
    this.updater.save()

class UpdateField
  constructor: (@element) ->

  save: ->
    $.post @url(), {_method: 'patch', field: @field(), value: @value()}, (response) ->
      console.log(response)

  #private

  field = ->
    @element.data('field')

  value = ->
    if @element.is('.with-toolbar') then @element.find('p').html() else @element.html()

  url = ->
    $('article').data('update-url')

$ ->
  new ArticleEditor
