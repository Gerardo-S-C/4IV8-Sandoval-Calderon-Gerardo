function validarn(e){
    var teclado = (document.all)?e.keyCode:e.which;
    //codigo de la tecla num.
    if(teclado == 8)return true;
            //numeros/digitos/ acepta el .
    var patron = /[0-9\d .]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}
function calcularEdad() {
    var hoy = new Date();
    var cumpleanos = new Date(document.formulario.cumples.value);
    var edad = hoy.getFullYear() - cumpleanos.getFullYear();
    var m = hoy.getMonth() - cumpleanos.getMonth();

    if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
        edad--;
    }
    document.formulario.final.value=edad;
}