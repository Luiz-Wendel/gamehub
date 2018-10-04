//= require bootstrap
//= require wiselinks
//= require jquery.raty
//= require ratyrate

/* Wiselinks Gem */
$(function(){
  window.wiselinks = new Wiselinks($('#home-detail'));
  
  /* Retirar a propriedade de avaliação do ratyrate ao incluir a classe 'readonly-star' na div que engloba o ratyrate */
  $(".readonly-star .star").each(function() {
    $(this).raty('set', { readOnly: true });
  });
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