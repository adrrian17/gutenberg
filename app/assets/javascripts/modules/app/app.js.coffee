window.Gutenberg =
  Alert: {}

Always = (->
  $('a.slide').pageslide()
)

$(document).on 'ready page:load', Always
