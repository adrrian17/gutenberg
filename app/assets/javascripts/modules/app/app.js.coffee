window.Gutenberg =
  Alert: {}

# Always = (->
#   $('a.slide').pageslide()
# )

Home = (->
  $('.book-title').on 'click', (e) ->
    e.preventDefault()

    slug = $(@).data 'slug'

    $.getJSON("/books/#{slug}.json")
    .done (book) ->
      $('#book-preview').html(BookModal(book)).modal()
    .fail ->
      console.log 'Nah'
)

BookModal = (book) ->
  loan_button = if book.copies > 0 then "<button class='btn btn-success' type='button'>Pedir prestado</button>" else "<button class='btn btn-succes' disabled='disabled' type='button'>Copias agotadas</button>"

  _.template("
    <div class='modal-dialog'>
      <div class='modal-content'>
        <div class='modal-header'>
          <h4 class='modal-title'><%= title %></h4>
        </div>
        <div class='modal-body'>
          <div class='row'>
            <img class='pull-left col-xs-6 col-sm-4 col-md-4 col-lg-4' src='http://placehold.it/150x220'/>
            <div class='col-xs-6 col-sm-6 col-md-6 col-lg-8'>
              <div class='row'>
                <strong>Autores:</strong>
                <span><%= authors_names %></span>
              </div>
              <div class='row'>
                <strong>Editorial:</strong>
                <span><%= pub_house_name %></span>
              </div>
              <div class='row'>
                <strong>Páginas:</strong>
                <span><%= pages %></span>
              </div>
              <div class='row'>
                <strong>Copias:</strong>
                <span><%= copies %></span>
              </div>
            </div>
          </div>
        </div>
        <div class='modal-footer'>
          <button class='btn btn-default' data-dismiss='modal' type='button'>Cerrar</button>
          #{loan_button}
        </div>
      </div>
    </div>", book)

$(document).on 'ready page:load', ->
  # do Always
  do Home

  loc = window.location;
  path = loc.pathname.substring 1, loc.pathname.lastIndexOf('/')
  $(".#{path}-nav").addClass('active')