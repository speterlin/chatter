jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()

    App.chat = App.cable.subscriptions.create {
        channel: "ChatChannel"
        chat_room_id: messages.data('chat-room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server
        console.log('connected')
      disconnected: ->
        # Called when the subscription has been terminated by the server
        console.log('disconnected')
      received: (data) ->
        # Called when there's incoming data on the websocket for this channel
          console.log('received')
          $('#messages').append(data['message'])
          messages_to_bottom()
      send_message: (message,chat_room_id) ->
        @perform 'send_message', message: message, chat_room_id: chat_room_id

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.chat.send_message textarea.val(), messages.data('chat-room-id')
        textarea.val('')
      e.preventDefault()
      return false

    $(document).on 'keypress', (event) ->
      if event.keyCode is 13
        $('#new_message').submit()
        event.preventDefault()
