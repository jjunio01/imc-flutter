import 'package:flutter/material.dart';
import 'package:imc/imc.dart';
import 'package:imc/main.dart';
import 'package:imc/model/pessoa.dart';

class ListarRegistros extends StatelessWidget {
  const ListarRegistros({Key? key, required this.values}) : super(key: key);

  final List<Pessoa> values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Registros'),
      ),
      body: ListView.builder(
        itemCount: values.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: const Icon(Icons.person_sharp),
              title: Text(values[index].nome),
              subtitle: Text(values[index].peso.toString()),
              onTap: () {
                double resultImc =
                    IMC.calcula(values[index].peso, values[index].altura);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Seu IMC:"),
                        content: Text(resultImc.toString()),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage(
                                          title: 'Calculadora IMC')));
                            },
                            child: const Text("OK"),
                          )
                        ],
                      );
                    });
              },
            ),
          );
        },
      ),
    );
  }
}
