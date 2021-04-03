function validarn(e){
    var teclado = (document.all)?e.keyCode:e.which;
    //codigo de la tecla num.
    if(teclado == 8)return true;
            //numeros/digitos/ acepta el .
    var patron = /[0-9\d .]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}


function chamba(){
    var horas= document.formulario.chambear.value;
    var horas=parseInt(horas);
    var base=500;
    var total=0;
    var extra=0;
    if(horas>80){
        alert("Es humano? por qué trabajar tanto?");
        return false;
    }
    else if(horas<1){
        alert("No creo que pueda trabajar a la inversa aqui");
        return false;
    }
    else if(horas>40){
            extras=horas-40;
            horas=8;
            if(extras>8){
                triple=extras-8;
                extras=8;
                total=(40*base)+(extras*1000)+(triple*1500);
            }
            else if(extra<=8){
                total=(40*base)+(extras*1000);
            }
    }   
    else if(horas<=40){
        total=base*horas;
    }
    
    else{
        alert("Ingrese datos validos");
        return false;
    }

 
    document.formulario.final.value = total;
}
