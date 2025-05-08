import 'package:flutter/material.dart';

class VerificarPrimo extends StatefulWidget {
  @override
  //State<OperacionesBasicas> createState() => OperacionesBasicasState();
  VerificarPrimoState createState() {
    print("1. Cretestate()");
    return VerificarPrimoState();
  }
}

class VerificarPrimoState extends State<VerificarPrimo> {
  //Logica
  TextEditingController numController = TextEditingController();
  String resultado = "";

  //Inicializar variables y objetos
  @override
  void initState() {
    super.initState();
    print("2. initState()");
  }

  //para trabajar con dependencias
  @override
  void didChangeDependencies() {
    print("3. didChangeDependencies()");
  }

  //comparar y reaccionar a cambios
  @override
  void didUpdateWidget(covariant VerificarPrimo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("4. didUpdateWidget()");
  }

  //deteccion de salida
  @override
  void deactivate() {
    print("5. deactivate()");
    super.deactivate();
  }

  //destruir statefull
  @override
  void dispose() {
    print("6. dispose()");
    numController.dispose();
    super.dispose();
  }

  //logica
  void esNumeroPrimo() {
    int numero = int.tryParse(numController.text) ?? 0;
    bool flagPrimo = true;

    String respuesta = "";
    if (numero < 2) {
      respuesta = "$numero no es primo";
    } else {
      for (int i = 2; i <= numero / 2; i++) {
        if (numero % i == 0) {
          flagPrimo = false;
          break;
        }
      }
      respuesta = flagPrimo ? "$numero es primo" : "$numero no es primo";
    }
    setState(() {
      resultado = respuesta;
    });
  }

  //diseño
  @override
  Widget build(BuildContext context) {
    print("7. build()");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verificar si es primo"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Ingrese un numero",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: esNumeroPrimo,
              child: const Text("Verificar"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:() { 
                Navigator.pop(context);
                }, 
              child: Text('Regresar'),
              ),
            const SizedBox(height: 16),
            Text(resultado, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
