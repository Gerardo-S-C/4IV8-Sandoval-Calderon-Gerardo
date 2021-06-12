/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//permitir solo numeros en campos de solo numeros
function validarn(e){
    var teclado=(document.all)?e.keyCode:e.which;
    if(teclado==8)return true;

    var patron=/[0-9\d .]/;

    var prueba=String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validard(e){
    var teclado=(document.all)?e.keyCode:e.which;
    if(teclado==8)return true;

    var patron=/[A-Za-z0-9\d .]/;

    var prueba=String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validar_datos(formulario){
    
    //validar longitud nombre
    if(formulario.nombre.value.length < 3){
        alert("Por favor escribe tres carácteres o más en tu nombre");
        formulario.nombre.focus();
        return false;
    }

    //validar longitud apellido paterno
    if(formulario.appat.value.length < 3){
        alert("Por favor escribe tres carácteres o más en tu apellido paterno");
        formulario.appat.focus();
        return false;
    }

    //validar longitud apellido paterno
    if(formulario.apmat.value.length < 3){
        alert("Por favor escribe tres carácteres o más en tu apellido materno");
        formulario.apmat.focus();
        return false;
    }
    
    //validar contraseña
    var p1=formulario.contra.value;
    var espacios = false;
    var cont = 0;

    while (!espacios && (cont < p1.length)) {
        if (p1.charAt(cont) == " ")
            espacios = true;
        cont++;
    }
    
    if (espacios) {
    alert ("La contraseña no puede contener espacios en blanco");
    return false;
    }

    if (p1.length == 0) {
        alert("Los campos de la password no pueden quedar vacios");
        return false;
    }

    if(p1.length<8){
        alert("La contraseña debe de tener 8 o más carácteres");
        return false;
    }
    
    //obtencion de datos de los input
    var checkOk="QWERTYUIOPASDFGHJKLÑZXCVBNM+"+"qwertyuiopasdfghjklñzxcvbnm"+" ";
    var checkNombre=formulario.nombre.value;
    var checkAppat=formulario.appat.value;
    var checkApmat=formulario.apmat.value;
    var checkEdad=formulario.edad.value;
    var allValid=true;
    
    //validacion edad apta para comprar en la aplicacion web
    if(checkEdad<18){
        alert("Debes de tener 18 años o más para poder comprar");
        return false;
    }else if(checkEdad>110){
        alert("Ingresa una edad entre 18 a 110 años");
        return false;
    }
    
     //validar nombre
    for(var i=0; i<checkNombre.length;i++){
        var ch=checkNombre.charAt(i);
        for(var j=0; j<checkOk.length; j++)
        if(ch==checkOk.charAt(j))
            break;
        if(j==checkOk.length){
            allValid=false;
            break;
        }
    }
    if(!allValid){
        alert("Escribe solo letras en tu nombre");
        formulario.nombre.focus();
        return false;
    }
    
    //validar apellido paterno
    for(var i=0; i<checkAppat.length;i++){
        var ch=checkAppat.charAt(i);
        for(var j=0; j<checkOk.length; j++)
        if(ch==checkOk.charAt(j))
            break;
        if(j==checkOk.length){
            allValid=false;
            break;
        }
    }
    if(!allValid){
        alert("Escribe solo letras en tu apellido paterno");
        formulario.appat.focus();
        return false;
    }

    //validar apellido materno
    for(var i=0; i<checkApmat.length;i++){
        var ch=checkApmat.charAt(i);
        for(var j=0; j<checkOk.length; j++)
        if(ch==checkOk.charAt(j))
            break;
        if(j==checkOk.length){
            allValid=false;
            break;
        }
    }
    if(!allValid){
        alert("Escribe solo letras en tu apellido materno");
        formulario.apmat.focus();
        return false;
    }
    
    //validar celular
    var checkOk="1234567890";
    var checkCel=formulario.celular.value;
    var allValid=true;

    for(var i=0; i<checkCel.length;i++){
        var ch=checkCel.charAt(i);
        for(var j=0; j<checkOk.length; j++)
        if(ch==checkOk.charAt(j))
            break;
        if(j==checkOk.length){
            allValid=false;
            break;
        }
    }
    
    //validar telefono
    var checkOk="1234567890";
    var checkTel=formulario.telefono.value;
    var allValid=true;

    for(var i=0; i<checkTel.length;i++){
        var ch=checkTel.charAt(i);
        for(var j=0; j<checkOk.length; j++)
        if(ch==checkOk.charAt(j))
            break;
        if(j==checkOk.length){
            allValid=false;
            break;
        }
    }
    
    //validar email
    var txt=formulario.correo.value;
    //expresion regular
    var b=/^[^@\s]+@[^@\.\s]+(\.[^@\.\s]+)+$/; //diagonal invertda s significa cadena
    alert("Email "+ (b.test(txt)?"":"no ")+"valido");
    return b.test(txt);
    
}