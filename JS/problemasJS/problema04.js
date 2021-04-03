//solo perimitira numeros
function validarn(e){
    var teclado = (document.all)?e.keyCode:e.which;
    //codigo de la tecla num.
    if(teclado == 8)return true;
            //numeros/digitos/ acepta el .
    var patron = /[0-9\d .]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

//operaciones
function promedios(){
    var num1=document.formulario.num1.value;
    var num2=document.formulario.num2.value;
    var num3=document.formulario.num3.value;
    var examen=document.formulario.examen.value;
    var texto=document.formulario.texto.value;


    var calif1=parseInt(num1);
    var calif2=parseInt(num2);
    var calif3=parseInt(num3);
    var exa=parseInt(examen);
    var tfinal=parseInt(texto);
    //Suma y valor del 55%
    var promedio= (calif1+calif2+calif3);
    var totalprom= (promedio*0.55)/30;
    //Suma del examen 30%
    var exaf= (exa*0.30)/10;
    //Suma del texto 15%
    var tfinalf= (tfinal*0.15)/10;
    //total
    var total=(totalprom+exaf+tfinalf)*10;
    document.formulario.final.value=total;
}
