function validarn(e){
    var teclado = (document.all)?e.keyCode:e.which;
    //codigo de la tecla num.
    if(teclado == 8)return true;
            //numeros/digitos/ acepta el .
    var patron = /[0-9\d .]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function alumnos(){
    var condicion=true;
    var toth=0;
    var totm=0;
    var hombres=document.formulario.Ho.value;
    var mujeres=document.formulario.Mu.value;

    var homb=parseInt(hombres);
    var muj=parseInt(mujeres);

    //operaciones
    total=homb+muj

    //condicionales
    if (total<homb){
        alert("No coinciden los datos");
        return false;
    }
    else if (total<muj){
        alert("No coinciden los datos");
        return false;
    }
    else if(homb==muj){
        alert("No coinciden los datos");
        return false;
    }
    if(condicion==true){
        if(total==homb){
            toth=100;
            totm=0;
        }
        else if(total==muj){
            toth=0;
            totm=100;
        }
        else{
            toth=(homb*100)/total;
            totm=(muj*100)/total;
        }
    }
    document.formulario.finalh.value=toth+"%";
    document.formulario.finalm.value=totm+"%";
}