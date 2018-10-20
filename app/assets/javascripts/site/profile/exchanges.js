$(document).ready(function(){
  
  if($('#exchange_price').val() == '0,00'){
    $('#exchange_price').val(null);
  }else{
    $('#exchange_price').val($('#exchange_price').val().replace(',00', ''));
  }
  
  $('#exchange_price').mask('00.000',{placeholder:"00.000", reverse: true});
  
  $('#new_exchange').submit(function() {
    var temp = $('#exchange_price').val();
    if(temp == ''){
      $('#exchange_price').val(0); // Caso o valor esteja vazio, seta como zero
    }else{
      $('#exchange_price').val($('#exchange_price').val().replace('.', '')); // Caso o valor contenha ponto, remove o ponto
    }
  });
  
  $('[id*="edit_exchange_"]').submit(function() { // pega o id parcial 'edit_exchange_'
    var temp = $('#exchange_price').val();
    if(temp == ''){
      $('#exchange_price').val(0); // Caso o valor esteja vazio, seta como zero
    }else{
      $('#exchange_price').val($('#exchange_price').val().replace('.', '')); // Caso o valor contenha ponto, remove o ponto
    }
  });
  
});
