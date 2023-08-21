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
  String? _nome, _sobrenome, _endereco,
          _email, _telefone, _obs;
  
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
                      onChanged: (value){ _nome = value; },
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
                      onChanged: (value) => _sobrenome = value,
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
                onChanged: (value) => _endereco = value,
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
                      onChanged: (value) => _email = value,
                      decoration: InputDecoration(
                        label: Text("E-mail"),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => _telefone = value,
                      decoration: InputDecoration(
                        label: Text("Telefone"),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.phone),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                onChanged: (value) => _obs = value,
                maxLines: 5,
                decoration: InputDecoration(
                  label: Text("Observações"),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.more),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 30,
                child: ElevatedButton.icon(
                    onPressed: (){
                      print("$_nome $_sobrenome $_endereco");
                      print("$_email $_telefone $_obs");
                    },
                    icon: Icon(Icons.save), 
                    label: Text("Cadastrar"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
