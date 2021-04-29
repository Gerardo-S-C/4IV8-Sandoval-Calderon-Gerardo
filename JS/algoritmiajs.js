function problema1(){

    var p1_input = document.querySelector('#p1-input').value;
    //identificar como dividir el texto escrito por espacios
    var p1_array = p1_input.split(' ').reverse();
    //habia   aibah

    //construir la nueva cadena invertida
    var p1_res = '';

    p1_array.forEach(function (palabra, i){
        //si es el principio o es el final de la cadena
        //y no agregamos espacios en blanco
        if(i != 0 || i != p1_array.length) p1_res += ' ';
        p1_res += palabra; 
    });
    //imprimir el resultado
    document.querySelector('#p1-output').textContent = p1_res;
}


//si es el principio o es el final de la cadena
//sieselprincipiooeselfinaldelacadena
//invertir
//si es elprincipiooeselfinaldelacadena


function problema2(){

    var p2_x1 = document.querySelector('#p2-x1').value;
    var p2_x2 = document.querySelector('#p2-x2').value;
    var p2_x3 = document.querySelector('#p2-x3').value;
    var p2_x4 = document.querySelector('#p2-x4').value;
    var p2_x5 = document.querySelector('#p2-x5').value;

    var p2_y1 = document.querySelector('#p2-y1').value;
    var p2_y2 = document.querySelector('#p2-y2').value;
    var p2_y3 = document.querySelector('#p2-y3').value;
    var p2_y4 = document.querySelector('#p2-y4').value;
    var p2_y5 = document.querySelector('#p2-y5').value;

    //construir los vectores

    var v1 = [p2_x1, p2_x2, p2_x3, p2_x4, p2_x5];
    var v2 = [p2_y1, p2_y2, p2_y3, p2_y4, p2_y5];

    //ordenar los vectores

    v1 = v1.sort(function (a, b){
        return b-a;
    });

    v2 = v2.sort(function (a, b){
        return b-a;
    });

    //invertir el segundo vector

    v2 = v2.reverse();

    //producto escalar
    var p2_producto = 0;

    for(var i = 0; i < v1.length; i++){
        p2_producto += v1[i] * v2[i];
    }

    document.querySelector('#p2-output').textContent =
    'Producto Escalar Minimo : '+ p2_producto;

}
function validar(palabra){
    var longitud = palabra.length;
    for(var i=0;i<longitud;i++){
        //charCodeAt= para identificar el esapcio de manera unicode
        if((i==0&&palabra.charCodeAt(i)==32)||(i==longitud-1&&palabra.charCodeAt(i)==32)||(palabra.charCodeAt(i)==32&&palabra.charCodeAt(i-1)==32)){
            if(i==0){
                alert("No coloque espacios al inicio de la entrada.");
            }
            else if(i==longitud-1){
                    alert("No coloque espacios al final de la entrada.");
            }
            return false;
        }
    }
    return true;
}
function problema3(){
    var p3_input = document.querySelector('#p3-input').value;
    var longitud;
    var maximo = 0;
    var aux;
    var limite = [27];
    var p3_array;
    var respuesta;
    var aux2=0;
    var aux_array;
    var bandera;
    //valida la entrada del input para identificar que no haya espacios al inicio o final
    if(validar(p3_input)){
        //identifica el que el texto se divide en comas
        p3_array = p3_input.split(',');
        
        p3_array.forEach(function (palabra){
            for(var j=0;j<26;j++){
                limite[j] = false;
            }
            aux = 0;
            longitud = palabra.length;
            for(var j=0;j<longitud;j++){
                if(!limite[palabra.charCodeAt(j)-65]){
                    aux++;
                    limite[palabra.charCodeAt(j)-65] = true;
                }
            }
            if(aux>maximo){
                respuesta = palabra;
                maximo = aux;
                aux2 = 1;
            }
            else{
                bandera = true;
                aux_array = respuesta.split(',');
                aux_array.forEach(function(palabra_aux){
                    if(palabra_aux==palabra){
                        bandera = false;
                    }
                })
                if(bandera == true){
                    if(aux==maximo){
                        aux2++;
                        if(aux2==2){
                            respuesta+=" y ";
                            respuesta+=palabra;
                        }
                        else{
                            respuesta = palabra + " , " + respuesta;
                        }
                    }
                }
            }
        });
        document.querySelector('#p3-output').textContent = 'La palabra con más caracteres únicos es: ' + respuesta + '.';
    }
    else{
        document.querySelector('#p3-input').value = "";
        document.querySelector('#p3-output').textContent = 'Esperando respuesta...';
    }
}