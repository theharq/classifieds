$(function(){ //ON DOCUMENT READY

  $(document).ajaxSend(function(event, request, settings) {
   $('.loading').show();
   });

   $(document).ajaxComplete(function(event, request, settings) {
     $('.loading').hide();
   });

}); // END ON READY