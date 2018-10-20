$(document).ready(function(){
  
  if($('#sale_price').val() == '0,00'){
    $('#sale_price').val(null);
  }else{
    $('#sale_price').val($('#sale_price').val().replace(',00', ''));
  }
  
  $('#sale_price').mask('00.000',{placeholder:"00.000", reverse: true});
  
  $('#new_sale').submit(function() {
    var temp = $('#sale_price').val();
    if(temp == ''){
      $('#sale_price').val(0); // Caso o valor esteja vazio, seta como zero
    }else{
      $('#sale_price').val($('#sale_price').val().replace('.', '')); // Caso o valor contenha ponto, remove o ponto
    }
  });
  
  $('[id*="edit_sale_"]').submit(function() { // pega o id parcial 'edit_sale_'
    var temp = $('#sale_price').val();
    if(temp == ''){
      $('#sale_price').val(0); // Caso o valor esteja vazio, seta como zero
    }else{
      $('#sale_price').val($('#sale_price').val().replace('.', '')); // Caso o valor contenha ponto, remove o ponto
    }
  });
  
});
