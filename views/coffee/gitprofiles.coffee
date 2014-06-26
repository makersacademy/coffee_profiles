addProfile = (user)->
  newProfile = Mustache.render($('#profile-template').html(), user)
  $('.profile-container').prepend(newProfile)

cleanup = ->
  $('#username').val('')
  $('.spinner').hide()


getProfile = (username)->
  $('.spinner').show()

  $.get("https://api.github.com/users/#{username}", (user)->
    addProfile(user)
  ).error(-> alert "There is no user called #{username}").always(->
    cleanup()
  )

$(document).ready(->
  $('#add_profile').on('submit', (event)->
    event.preventDefault()
    getProfile($('#username').val())
  )
)
