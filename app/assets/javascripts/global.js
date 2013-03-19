$(function(){ //ON DOCUMENT READY

  $(document).ajaxSend(function(event, request, settings) {
    $('.loading').show();
  });

  $(document).ajaxComplete(function(event, request, settings) {
    $('.loading').hide();
  });

  $('.input-tag').tag({placeholder: "Ingrese palabras clave"});

}); // END ON READY