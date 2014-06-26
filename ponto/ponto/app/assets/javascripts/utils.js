function setFuncionario(funcionario_id, funcionario_nome){
  $('#funcionarioLabel').html('Abonar horas de: #'+funcionario_id+' '+funcionario_nome);
  $('#funcionarioid_abonar').val(funcionario_id);
}

function abonarHoras(){
   var funcionarioid = $('#funcionarioid_abonar').val();
   var data = $('#data_abonar').val();
   var horas = $('#horas_abonar').val();
   var justificativa = $('#justificativa_abonar').val();
  
   if (data !== '' && horas !== ''){
     
     // Mostra a mensagem de sucessso
     $("#alert-sucesso").css("display", "block");
     $("#alert-sucesso").addClass("in");
     
     setTimeout(function(){
       
       // Remove a mensagem de sucesso
       $("#alert-sucesso").removeClass("in");
       $("#alert-sucesso").css("display", "none");
       
       // Aqui chama o ajax para gravar o abono de horas
       
       // Fecha o modal
       $('#abonar_horas').modal('hide');  
       
       // Limpa os campos
       $('#data_abonar').val('');
       $('#horas_abonar').val('');
       $('#justificativa_abonar').val('');
     }, 3000);
     
   }
  
   return false;
}