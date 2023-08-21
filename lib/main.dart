import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaFormulario(),
  ));
}

//Criar um Widget Scaffold
class TelaFormulario extends StatefulWidget {
  const TelaFormulario({super.key});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Formulário de cadastro",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Nome"),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.abc),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Sobrenome"),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.abc),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Endereço"),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.local_activity),
                ),
              ),
              Row(
                children: [

                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("E-mail"),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),

                  SizedBox(width: 30,),

                    Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Telefone"),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.phone),
                      ),
                    ),
                  ),



                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
