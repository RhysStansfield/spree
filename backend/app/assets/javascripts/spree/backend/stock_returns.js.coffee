$(document).ready ->
  $('#variant_id').select2
    width: '80%'

  $('#new_refund form').submit ->
    form = $(this)
    $.post(form.data('url'),
      {
        refund: {
          variant_id: form.find('#variant_id').val()
          quantity: form.find('#quantity').val()
        }
      } 
    ).done (response) ->
      window.location.reload();
    false

  $('#new_exchange form').submit ->
    form = $(this)
    $.post(form.data('url'),
      {
        exchange: {
          variant_id: form.find('#variant_id').val()
        }
      } 
    ).done (response) ->
      window.location.reload();
    false