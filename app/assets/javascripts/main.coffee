$ ->
  $('header').headroom
    'offset': 205
    'tolerance': 5
    'classes':
      'pinned': 'slideDown'
      'unpinned': 'slideUp'

  #$('.preloader').hide()

  #$('.pagination').infinitePages
    #loading: ->
      #console.log('show')
      #$('.preloader').show()
    #success: ->
      #console.log('hide')
      #$('.preloader').hide()
    #error: ->
      #console.log('error')
      #$(this).text('There was an error, please try again')
