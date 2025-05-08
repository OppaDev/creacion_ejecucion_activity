import 'package:flutter/material.dart';

class Numeros extends StatefulWidget{
  const Numeros({super.key});

  @override
  State<Numeros> createState() => _NumerosState();
}

class _NumerosState extends State<Numeros>{
  TextEditingController numBox = TextEditingController();
  static const int limte = 10;
  final List<double> listaNumeros = [];
  int menores15 = 0;
  int mayores50 = 0;
  int numEntre = 0;
  double promedio = 0;


  @override
  void dispose() {
    numBox.dispose();
    super.dispose();
  }

  void agregarNumeros(){
    if (numBox.text.isEmpty) return;
    final number = double.tryParse(numBox.text);
    if (number == null){
      _showError('Ingrese un numero valido');
      return;
    }

    setState(() {
      listaNumeros.add(number);
      numBox.clear();
    });

    if (listaNumeros.length >= limte){
      for (int k=0; k<listaNumeros.length;k++){
          if (listaNumeros[k] < 15){
            menores15++;
          }
          if(listaNumeros[k]> 50){
            mayores50++;
          }
          if(listaNumeros[k] >=25 && listaNumeros[k] <=45){
            numEntre++;
          }
          promedio = promedio + listaNumeros[k];
      }
      promedio = promedio / limte;
      _showResult();
    }
  }



  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Resultado'),
        content: Text('Has ingresado $limte números\nPromedio: $promedio\n'
            'numeros menores  a 15= $menores15\nEntre 24 y 45= $numEntre\n'
            'Mayores a 50= $mayores50'),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                listaNumeros.clear();
                menores15 = 0;
                promedio = 0;
                numEntre=0;
                mayores50 = 0;
              });
            },
            child: Text('Reiniciar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sumar $limte Números')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: numBox,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese el número ${listaNumeros.length + 1} de $limte',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => agregarNumeros(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: agregarNumeros,
              child: Text('Agregar Número'),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}