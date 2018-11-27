$(document).ready(function(){
  $('#rating_rate_val').on('change', function(){
    $('#rating_val').text($('#rating_rate_val').val());
  });
});
