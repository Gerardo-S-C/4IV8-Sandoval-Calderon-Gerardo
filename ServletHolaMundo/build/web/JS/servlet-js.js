/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function ValidarCampos(formulario){

    if(formulario.edad.value.length>0){
        if(isNaN(parseInt(formulario.edad.value))) {
            alert('Escriba correctamente su edad.');
            return false; 
        }
    }else{
        alert('Falta por rellenar el campo "Edad"');
        return false;            
    }
    
    
    
    if(formulario.email.value.length>0){
        var patronEmail=/^[^@\s]+@[^@\.\s]+(\.[^@\.\s]+)+$/;       
        if (!(patronEmail.test(formulario.email.value))) {
            alert('Contenido del email no es un correo electrónico válido.');
            return false; 
        }            
    }else{
        alert('Falta por rellenar el campo "Email"');
        return false;                
    }

}