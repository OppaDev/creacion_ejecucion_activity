import 'package:flutter/material.dart';

class Compania extends StatefulWidget {
  @override
  State<Compania> createState() => _CompaniaState();
}

class _CompaniaState extends State<Compania> {
  // Controladores
  final TextEditingController edadEmpleadoController = TextEditingController();
  final TextEditingController aniosEnEmpresaController = TextEditingController();

  int? sueldoEmpleado;
  String? errorMessage;

  // Validaciones
  bool esEnteroPositivo(int numero) {
    return numero >= 0 && numero % 1 == 0;
  }

  // Cálculos
  int cantidadAnios(int anios) {
    if (!esEnteroPositivo(anios)) {
      // Asignar error sin modificar cálculo
      errorMessage = 'El número de años no es válido';
      return 0;
    }
    int cantidad = 0;
    for (int i = 0; i <= anios; i++) {
      cantidad += i;
    }
    return cantidad;
  }

  void calcularSueldo() {
    setState(() {
      errorMessage = null;
      sueldoEmpleado = null;

      final edadEmpleado = int.tryParse(edadEmpleadoController.text);
      final aniosEmpresa = int.tryParse(aniosEnEmpresaController.text);

      // Validar parseo
      if (edadEmpleado == null) {
        errorMessage = 'Edad inválida';
        return;
      }
      if (aniosEmpresa == null) {
        errorMessage = 'Años en empresa inválidos';
        return;
      }

      // Validar rango de edad y positiv.
      if (!esEnteroPositivo(edadEmpleado) || edadEmpleado < 18) {
        errorMessage = 'La edad no es válida';
        return;
      }

      // Calcular años de trabajo
      final aniosTrabajo = cantidadAnios(aniosEmpresa);
      if (errorMessage != null) {
        return;
      }

      // calcular sueldo
      sueldoEmpleado = 35000 + edadEmpleado + 100 * aniosTrabajo;
    });
  }

  @override
  void dispose() {
    edadEmpleadoController.dispose();
    aniosEnEmpresaController.dispose();
    super.dispose();
  }

//diseño de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compania'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: edadEmpleadoController,
              decoration: const InputDecoration(labelText: 'Edad del empleado'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: aniosEnEmpresaController,
              decoration: const InputDecoration(labelText: 'Años en la empresa'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularSueldo,
              child: const Text('Calcular Sueldo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:() { 
                Navigator.pop(context);
                }, 
              child: Text('Regresar'),
              ),
            const SizedBox(height: 16),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              )
            else if (sueldoEmpleado != null)
              Text('El sueldo del empleado es: \$${sueldoEmpleado}'),
          ],
        ),
      ),
    );
  }
}
