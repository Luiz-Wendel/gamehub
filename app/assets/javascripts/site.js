//= require bootstrap
//= require wiselinks
//= require jquery.raty
//= require ratyrate
/*********************************************************
      Setar a classe 'active' para a tag <a>
*********************************************************/
$(document).ready(function(){
  if (sessionStorage.getItem("hasRunBefore") === null) { // Verifica se é a primeira vez na página
    sessionStorage.setItem('a_active', 0); // Se for, seta o item 'a_active' da sessions storage para '0'
    sessionStorage.setItem("hasRunBefore", true); // E o item 'hasRunBefore' para 'true'
  }
  setAba();
  setActive();
});

$(document).ajaxComplete(function(){
  setAba();
  setActive();
});

/* Wiselinks Gem */
$(function(){
  window.wiselinks = new Wiselinks($('#home-detail'));
  
  /* Retirar a propriedade de avaliação do ratyrate ao incluir a classe 'readonly-star' na div que engloba o ratyrate 
  $(".readonly-star .star").each(function() {
    $(this).raty('set', { readOnly: true });
  });*/
});

/* Funções para resetar o carousel ao fazer o refresh da página */
$('.carousel').carousel({
  pause: true,
  interval: false
}).carousel(0);

$(window).on('change', function () {
  var initial = $('ol.carousel-indicators li').attr('data-slide-to', 0);
  initial.addClass('active');
});
/* ######################################################################################################################## */

/* Funções para setar a aba da classe nav-tabs */
/* Not funfando
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

function setAba() {
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
  
  $(".nav-tabs a").on("shown.bs.tab", function(e) { // Seleciona a aba que está sendo clicada
    var id = $(e.target).attr("href"); // Pega o id do elemento
    sessionStorage.setItem('temp', id); // Seta o item 'temp' da session storage como sendo o id do elemento
  });
}
/* ######################################################################################################################## */

/* Função para colocar uma classe ao clicar em uma tag <a> */
function setActive(){
  jQuery('[id*="a_platform_"]').each(function() { // Executa para cada elemento com id parcial = 'a_platform_'
    if($(this).attr('id').substr($(this).attr('id').length - 2).replace('_', '') == sessionStorage.getItem('a_active')){ // Verifica se o final do id do elemento é igual ao item 'a_active' do session storage
      $(this).addClass('active'); // Se for igual, adiciona a classe 'active' ao elemento
    }
  });
  
  $('[id*="a_platform_"]').on('click', function(e){ // Executa ao clicar em um elemento com id parcial = 'a_platform_'
    sessionStorage.setItem('a_active', e.target.id.substr(e.target.id.length - 2).replace('_', '')); // Seta o item 'a_active' da session storage como sendo o número do final id do elemento clicado
  });
  
  $('.navbar-brand,#home-link,#sair-link,#perfil-link,#btn-pesquisar').on('click', function(){
    sessionStorage.setItem('a_active', 0); // Seta o item 'a_active' da session storage para '0' quando clicar em algum dos elementos listados acima
  });
}
/* ######################################################################################################################## */
