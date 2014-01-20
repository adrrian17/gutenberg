AUTH_TOKEN = $("[name=csrf-token]").attr("content")

window.Loan = (->
  $('#loan').on 'click', ->
    loan=
      user_id:      @.dataset.userId
      item_id:      @.dataset.id
      item_type_id: @.dataset.typeId

    # $.post '/loans', loan, (response) ->
    #   console.log response
    #   headers: 'X-CSRF-Token': AUTH_TOKEN
    #  .done ->

    #  alert "Ya casi"
    # .fail ->
    #   #Gutenberg.Alert.info '', 'Keep trying ;).'
    #   alert "Fail fap"

    $.ajax({
      type:    'POST',
      url:     '/loans',
      headers: 'X-CSRF-Token': AUTH_TOKEN,
      data:    loan
    })
    # .done ->
    #   alert "Ya casi"
    # .fail ->
    #   alert "Fail fap"
)