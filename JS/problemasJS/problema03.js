function validarn(e){
    var teclado = (document.all)?e.keyCode:e.which;
    //codigo de la tecla num.
    if(teclado == 8)return true;
            //numeros/digitos/ acepta el .
    var patron = /[0-9\d .]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function descuento(){
    var valor = document.formulario.cantidad.value;
    var result = parseInt(valor);
    var descuento = result*0.15;
    var total = result-descuento;
    document.formulario.sueldoti.value = "$"+total;
}