function getProfile(username) {
  $('.spinner').show();

  $.get('https://api.github.com/users/' + username, function(user){
      var newProfile = Mustache.render($('#profile-template').html(), user);
      $('.profile-container').prepend(newProfile);
      }).error(function(){
    alert("There is no user called " + username);
  }).always(function(){
        $('#username').val('');
        $('.spinner').hide();
      })
}

$(document).ready(function(){

  $('#add_profile').on('submit', function(event){
    event.preventDefault();
    getProfile($('#username').val())
  });
});
