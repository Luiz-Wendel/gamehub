//= require bootstrap

/* Funções para resetar o carousel ao fazer o refresh da página */
$('.carousel').carousel({
    pause: true,
    interval: false
}).carousel(0);

$(window).on('load', function () {
    var initial = $('ol.carousel-indicators li').attr('data-slide-to', 0);
    initial.addClass('active');
});
