function validarn(e){
    var teclado = (document.all)?e.keyCode:e.which;
    //codigo de la tecla num.
    if(teclado == 8)return true;
            //numeros/digitos/ acepta el .
    var patron = /[0-9\d .]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function utilidadF(){
    var tiempo= parseInt(document.formulario.utilidad.value);
    var mensualidad=20000;
    var total=0;
    
    if(tiempo<1){
        total=mensualidad*0.05;
    }
    else if(tiempo>=1&&tiempo<2){
        total=mensualidad*0.07;
    }
    else if(tiempo>=2&&tiempo<5){
        total=mensualidad*0.1;
    }
    else if(tiempo>=5&&tiempo<10){
        total=mensualidad*0.15;
    }
    else if(tiempo>=10){
        total=mensualidad*0.2;
    }
    else{
        alert("Ingrese un dato valido");
        return false;
    }

    document.formulario.final.value = total;
}