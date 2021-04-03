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
function sumar(valor){
    var total = 0;	
    valor = parseInt(valor);
	var num1 = document.getElementById("num1").value;
    var num2 = document.getElementById("num2").value;
    var num3 = document.getElementById("num3").value;
    total = document.getElementById('spTotal').innerHTML;
    // Aquí valido si hay un valor previo, si no hay datos, le pongo un cero "0".
    total = (total == null || total == undefined || total == "") ? 0 : total;	
    /* Esta es la suma. */
    valor1 = parseInt(num1)+(parseInt(num1)*0.1);
    valor2 = parseInt(num2)+(parseInt(num2)*0.1);
    valor3 = parseInt(num3)+(parseInt(num3)*0.1);

    total = parseInt(valor1)+parseInt(valor2)+parseInt(valor3);
    // Colocar el resultado de la suma en el id
    document.getElementById('Producto1').innerHTML = valor1;
    document.getElementById('Producto2').innerHTML = valor2;
    document.getElementById('Producto3').innerHTML = valor3;
    document.getElementById('spTotal').innerHTML = total;
}

