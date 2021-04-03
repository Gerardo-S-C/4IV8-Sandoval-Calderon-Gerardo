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
    var nume1=document.formulario.num1.value;
    var nume2=document.formulario.num2.value;
    var nume3=document.formulario.num3.value;

    var nume1=parseInt(nume1);
    var nume2=parseInt(nume2);
    var nume3=parseInt(nume3);
    var total=0;
    if (nume1>nume2&&nume1>nume3) {
        total=nume1;
    }
    else if(nume2>nume1&&nume2>nume3){
        total=nume2;
    }
    else if(nume3>nume1&&nume3>nume2){
        total=nume3;
    }
    else if(nume1==nume2||nume1==nume3){
        alert("Ingrese numeros distintos entre si");
        return false;
    }
    else if(nume2==nume3){
        alert("Ingrese valores distintos entre si");
        return false;
    }
    else{
        alert("Llena los campos");
        return false;
    }
    document.formulario.final.value=total;
}