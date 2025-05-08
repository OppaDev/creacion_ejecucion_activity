import 'package:flutter/material.dart';

class NumerosNat extends StatefulWidget {
  @override
  State<NumerosNat> createState() => _NumerosNatState();
}

class _NumerosNatState extends State<NumerosNat> {
  //logica
  String? respuesta ;
  //metodos
  //generara numeros naturales
  List<int> genNumNaturales(int n) {
    List<int> numeros = List<int>.generate(n, (_) => (1 + (100 * (new DateTime.now().microsecondsSinceEpoch % 1000) / 1000).toInt()));
    return numeros;
  }

  void opciones(String opcion) {
    //variables
    List<int> numerosNaturales = [];    
    numerosNaturales = genNumNaturales(100);
    String resultado = '';

    switch (opcion) {
      case 'imprimir':
        resultado = 'Los números naturales son: ${numerosNaturales.join(', ')}';
        break;
      case 'a':
        // contar numeros < 15
        int contador = 0;
        for (int i = 0; i < numerosNaturales.length; i++) {
          if (numerosNaturales[i] < 15) {
            contador++;
          }
        }
        resultado = 'Cantidad de números naturales menores a 15: $contador';
        break;
      case 'b':
        //contar numeros > 50
        int contador = 0;
        for (int i = 0; i < numerosNaturales.length; i++) {
          if (numerosNaturales[i] > 50) {
            contador++;
          }
        }
        resultado = 'Cantidad de números naturales mayores a 50: $contador';
        break;
      case 'c':
        //contar numeros entre 25 y 45
        int contador = 0;
        for (int i = 0; i < numerosNaturales.length; i++) {
          if (numerosNaturales[i] >= 25 && numerosNaturales[i] <= 45) {
            contador++;
          }
        }
        resultado = 'Cantidad de números naturales entre 25 y 45: $contador';
        break;
      case 'd':
        //promedio 100 numeros naturales
        int suma = 0;
        for (int i = 0; i < numerosNaturales.length; i++) {
          suma += numerosNaturales[i];
        }
        double promedio = suma / numerosNaturales.length;
        resultado = 'El promedio de los 100 números naturales es: $promedio';
        break;
    }
    setState(() {
      respuesta = resultado;
    });

  }
  //Diseño de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Números Naturales'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => opciones('imprimir'),
              child: const Text('Imprimir Números Naturales'),
            ),
            ElevatedButton(
              onPressed: () => opciones('a'),
              child: const Text('Contar números < 15'),
            ),
            ElevatedButton(
              onPressed: () => opciones('b'),
              child: const Text('Contar números > 50'),
            ),
            ElevatedButton(
              onPressed: () => opciones('c'),
              child: const Text('Contar números entre 25 y 45'),
            ),
            ElevatedButton(
              onPressed: () => opciones('d'),
              child: const Text('Calcular promedio de 100 números naturales'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:() { 
                Navigator.pop(context);
                }, 
              child: Text('Regresar'),
              ),
            if (respuesta != null) ...[
              const SizedBox(height: 20),
              Text(respuesta!),
            ],
          ],
        ),
      ),
    );
  }
}
