/*
$(document).on('ready ajaxComplete', function(){
  if(sessionStorage.getItem('temp') == null){
    $('#exchanges-menu').addClass("active");
  }else{
    if(sessionStorage.getItem('temp') == '#exchanges-tabs'){
      $('#exchanges-menu').addClass("active");
      $('#exchanges-tabs').addClass("active in");
      $('#sales-tabs').removeClass("active in");
    }else if(sessionStorage.getItem('temp') == '#sales-tabs'){
      $('#sales-menu').addClass("active");
      $('#sales-tabs').addClass("active in");
      $('#exchanges-tabs').removeClass("active in");
    }
  }
  
  $('#home-tabs a').click(function(e) {
    e.preventDefault();
    $(this).tab('show');
  });
  
  // store the currently selected tab in the hash value
  $(".nav-tabs a").on("shown.bs.tab", function(e) {
    var id = $(e.target).attr("href");
    sessionStorage.setItem('temp', id);
  });
});
*/

$(document).ready(function(){
  if(sessionStorage.getItem('temp') == null){
    $('#exchanges-menu').addClass("active");
  }else{
    if(sessionStorage.getItem('temp') == '#exchanges-tabs'){
      $('#exchanges-menu').addClass("active");
      $('#exchanges-tabs').addClass("active in");
      $('#sales-tabs').removeClass("active in");
    }else if(sessionStorage.getItem('temp') == '#sales-tabs'){
      $('#sales-menu').addClass("active");
      $('#sales-tabs').addClass("active in");
      $('#exchanges-tabs').removeClass("active in");
    }
  }
  
  $('#home-tabs a').click(function(e) {
    e.preventDefault();
    $(this).tab('show');
  });
  
  // store the currently selected tab in the hash value
  $(".nav-tabs a").on("shown.bs.tab", function(e) {
    var id = $(e.target).attr("href");
    sessionStorage.setItem('temp', id);
  });
});

$(document).ajaxComplete(function(){
  if(sessionStorage.getItem('temp') == null){
    $('#exchanges-menu').addClass("active");
  }else{
    if(sessionStorage.getItem('temp') == '#exchanges-tabs'){
      $('#exchanges-menu').addClass("active");
      $('#exchanges-tabs').addClass("active in");
      $('#sales-tabs').removeClass("active in");
    }else if(sessionStorage.getItem('temp') == '#sales-tabs'){
      $('#sales-menu').addClass("active");
      $('#sales-tabs').addClass("active in");
      $('#exchanges-tabs').removeClass("active in");
    }
  }
  
  $('#home-tabs a').click(function(e) {
    e.preventDefault();
    $(this).tab('show');
  });
  
  // store the currently selected tab in the hash value
  $(".nav-tabs a").on("shown.bs.tab", function(e) {
    var id = $(e.target).attr("href");
    sessionStorage.setItem('temp', id);
  });
});