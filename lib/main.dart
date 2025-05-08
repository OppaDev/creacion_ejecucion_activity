import 'screens/compania.dart';
import 'package:flutter/material.dart';
import 'screens/numerosAmigos.dart';
import 'screens/numerosNat.dart';
import 'screens/valorSerie.dart';
import 'screens/verificar_primo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creación y ejecución de una Activity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Creación y ejecución de una Activity'),
        '/compania': (context) => Compania(),
        '/numerosNat': (context) => NumerosNat(),
        '/numerosAmigos': (context) => NumerosAmigos(),
        '/valorSerie': (context) => ValorSerie(),
        '/verificarPrimo': (context) => VerificarPrimo(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children:[
            const Text('Elige una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/compania');
              },
              child: const Text('Compania'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/numerosNat');
              },
              child: const Text('Numeros Naturales'),
            ),  
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/numerosAmigos');
              },
              child: const Text('Numeros Amigos'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/valorSerie');
              },
              child: const Text('Valor de la serie'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/verificarPrimo');
              },
              child: const Text('Verificar si es primo'),
            ),            
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
