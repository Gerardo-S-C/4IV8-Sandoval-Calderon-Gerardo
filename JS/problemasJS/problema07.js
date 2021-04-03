function validarn(e){
    var teclado = (document.all)?e.keyCode:e.which;
    //codigo de la tecla num.
    if(teclado == 8)return true;
            //numeros/digitos/ acepta el .
    var patron = /[0-9\d .]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function operaciones(){
    var num1=document.formulario.numero1.value;
    var num2=document.formulario.numero2.value;

    var num1=parseInt(num1);
    var num2=parseInt(num2);
    total=0;
    if(num1==num2){
        total=num1*num2;
    }
    else if (num1>num2){
        total=num1-num2;
    }
    else if(num1<num2){
        total=num1+num2;
    }
    else{
        alert("No deberia salirte este error");
        return false;
    }

    document.formulario.final.value=total;
}
