(($) ->
  $.fn.checkAll = (cla) ->
    @each ->
      $(this).on 'click', ->
        if $(this).is(':checked')
          $(cla).prop('checked', true)
        else
          $(cla).prop('checked', false)

  $.fn.checkDisable = (id) ->
    $(this).on 'click', ->
      if $(this).is(":checked")
        $(id).removeAttr("disabled")
      else
        $(id).attr("disabled", "disabled")
) jQuery
