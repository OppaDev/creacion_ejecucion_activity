import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ValorSerie extends StatefulWidget {
  @override
  State<ValorSerie> createState() => _ValorSerieState();
}

class _ValorSerieState extends State<ValorSerie> {
  // Controladores
  final TextEditingController valorDeXController = TextEditingController();
  final TextEditingController valorDeNController = TextEditingController();

  double? resultadoSerie;
  String? errorMessage;

  // Validaciones
  bool esEnteroPositivo(int numero) {
    return numero >= 0 && numero % 1 == 0;
  }

  //metodo factorial
  double factorial(int numero) {
    if (numero == 0 || numero == 1) {
      return 1;
    } else {
      return numero * factorial(numero - 1);
    }
  }

  //calculo de la serie
  void calcularSerie() {
    setState(() {
      errorMessage = null;
      resultadoSerie = null;

      final valorDeX = double.tryParse(valorDeXController.text);
      final valorDeN = int.tryParse(valorDeNController.text);

      // Validar parseo
      if (valorDeX == null) {
        errorMessage = 'Valor de X inválido';
        return;
      }
      if (valorDeN == null) {
        errorMessage = 'Valor de N inválido';
        return;
      }

      // validar si n es entero positivo
      if (!esEnteroPositivo(valorDeN.toInt())) {
        errorMessage = 'El valor de N no es válido';
        return;
      }

      // Calcular la serie Sn
      double suma = 1;
      for (int n = 1; n <= valorDeN; n++) {
        double termino = pow(valorDeX, n) / factorial(n);
        suma += termino;
      }
      resultadoSerie = suma;
    });
  }

  @override
  void dispose() {
    valorDeXController.dispose();
    valorDeNController.dispose();
    super.dispose();
  }

  //diseño de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valor de la serie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: valorDeXController,
              decoration: InputDecoration(labelText: 'Valor de X'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: valorDeNController,
              decoration: InputDecoration(labelText: 'Valor de N'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularSerie,
              child: Text('Calcular'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:() { 
                Navigator.pop(context);
                }, 
              child: Text('Regresar'),
              ),
            SizedBox(height: 20),
            if (resultadoSerie != null)
              Text('Resultado de la serie Sn = $resultadoSerie'),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
