import 'dart:js_interop';

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _opcaoSelecionada = 'Selecione';
  List<String> _opcoes = ['Selecione','Opção 1', 'Opção 2', 'Opção 3'];
  String? _selecioneCurso; 
  //String _selecioneCurso = "Administração"; 
  List<String> _cursos = ['TI', 'Administração', 'Eletrotécnica'];
  Color corTexto = Colors.transparent;
  bool _tiChecked = false;
  bool _admChecked = false;
  bool _eltChecked = false;
  DateTime dataSelecionada = DateTime.now();


  Future<void> _escolherData(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: dataSelecionada,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dataSelecionada)
      setState(() {
        dataSelecionada = picked;

      });
  }


  void _enviarFormulario() {
    if(_selecioneCurso.isNull){
      setState(() {
        corTexto =  Colors.red;
      });      
    }else{
      setState(() {
        corTexto =  Colors.transparent;
      }); 
    }
    if (_formKey.currentState!.validate()) {
      // Do something with the validated email
      print('Email is valid: $_email');
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                validator: (value) => _validateEmail(_email),
                onChanged: (value) {
                  _email = value;
                },
              ),
              //--------------------------------------------
               DropdownButtonFormField<String>(
                validator: (value) => _validarComboBox(value.toString()),
                value: _opcaoSelecionada,
                onChanged: (novoValor) {
                  setState(() {
                    _opcaoSelecionada = novoValor!;
                  });
                },
                items: _opcoes.map((opcao) {
                  return DropdownMenuItem<String>(
                    value: opcao,
                    child: Text(opcao),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Opções',
                ),
              ),
              //--------------------------------------------
              Text('Selecione seu curso:'),
              Text("Por favor, selecione uma opção", style: TextStyle(color: corTexto),),
              Column(
                children: _cursos.map((cursos) {
                  return RadioListTile(
                    title: Text(cursos),
                    value: cursos,
                    groupValue: _selecioneCurso,
                    onChanged: (value) {
                      setState(() {
                        _selecioneCurso = value.toString();
                      });
                    },
                  );
                }).toList(),
              ),
              //--------------------------------------------
              CheckboxListTile(
              title: Text('TI'),
              value: _tiChecked,
              onChanged: (bool? value) {
                setState(() {
                  _tiChecked = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('ADM'),
              value: _admChecked,
              onChanged: (bool? value) {
                setState(() {
                  _admChecked = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('ELT'),
              value: _eltChecked,
              onChanged: (bool? value) {
                setState(() {
                  _eltChecked = value!;
                });
              },
            ),
              //--------------------------------------------
               Row(
                children: [
                  Text("${dataSelecionada.toLocal()}".split(' ')[0],),
              ElevatedButton(
                 onPressed: () => _escolherData(context),
                 child: Text('Selecionar Data'),
               ),
                ],
               ),
               
              //--------------------------------------------

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _enviarFormulario,
                child: Text('Enviar'),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}



  String? _validarComboBox(String texto){
    if(texto == "Selecione"){
      return "Por favor, selecione uma opção";
    }
    return null;
  }


 String? _validateEmail(String texto) {
    //Verificar se está vazio
    if (texto.isEmpty) {
      return 'Por favor, insira um email.';
    }
    //Verificar se não o @
    if (!texto.contains('@') || !texto.contains(".")) {
      return 'Por favor, insira um email válido.';
    }
    //Verificar se tem espaços
    if (texto.contains(' ')){
      return 'Por favor, não coloque espaços em branco.';
    }
    //Se estiver tudo certo retorna null
    return null;
  }

  String? validatorRadioButton(String opcao){
    if(opcao.isNull){
      return "Selecione uma opção";
    }
      return null;
  }