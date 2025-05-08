import 'dart:math';

import 'package:flutter/material.dart';

class NumerosAmigos extends StatefulWidget {
  @override
  State<NumerosAmigos> createState() => _NumerosAmigosState();
}


class _NumerosAmigosState extends State<NumerosAmigos> {
  //Logica del programa
  // controladores
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();
  
  String? resultado;
  String? errorMessage;

  //validaciones
  bool esEnteroPositivo(int numero) {
    return numero >= 0 && numero % 1 == 0;
  }

  //calculos
  bool sonNumerosAmigos(int num1, int num2) {
    int sumaDivisoresNum1 = 0;
    int sumaDivisoresNum2 = 0;

    for (int i = 1; i < num1; i++) {
      if (num1 % i == 0) {
        sumaDivisoresNum1 += i;
      }
    }

    for (int j = 1; j < num2; j++) {
      if (num2 % j == 0) {
        sumaDivisoresNum2 += j;
      }
    }

    return sumaDivisoresNum1 == num2 && sumaDivisoresNum2 == num1;
  }

  void mostrarResultado() {
    setState(() {
      errorMessage = null;
      resultado = null;

      final numero1 = int.tryParse(numero1Controller.text);
      final numero2 = int.tryParse(numero2Controller.text);

      // Validar parseo
      if (numero1 == null) {
        errorMessage = 'Número 1 inválido';
        return;
      }
      if (numero2 == null) {
        errorMessage = 'Número 2 inválido';
        return;
      }

      // Validar positiv.
      if (!esEnteroPositivo(numero1)) {
        errorMessage = 'El número 1 no es válido';
        return;
      }
      if (!esEnteroPositivo(numero2)) {
        errorMessage = 'El número 2 no es válido';
        return;
      }

      // Calcular si son amigos
      if (sonNumerosAmigos(numero1, numero2)) {
        resultado = 'Los números son amigos.';
      } else {
        resultado = 'Los números no son amigos.';
      }
    });
  }
  @override
  void dispose() {
    numero1Controller.dispose();
    numero2Controller.dispose();
    super.dispose();
  }

  //diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Números Amigos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numero1Controller,
              decoration: InputDecoration(
                labelText: 'Número 1',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: numero2Controller,
              decoration: InputDecoration(
                labelText: 'Número 2',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: mostrarResultado,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:() { 
                Navigator.pop(context);
                }, 
              child: Text('Regresar'),
              ),
            const SizedBox(height: 20),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              )
            else if (resultado != null)
              Text('$resultado',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }

}