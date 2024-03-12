import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//método que roda a aplicação
void main(){
  runApp(Principal());
}

class Principal extends StatelessWidget{
  //Construção do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Aplicação com Api',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: home(),
    );
  }
}

class home extends StatefulWidget{
  @override
  home_state createState() => home_state();
}

class home_state extends State<home>{
  //Permite manipular o texto dentro do campo  de input
  TextEditingController controleTexto = TextEditingController();
  String conteudo = '';
  String imagem = '';

  Future<void> buscar() async{
    String entrada = controleTexto.text;
    String url = 'https://pt.wikipedia.org/api/rest_v1/page/summary/$entrada';

    final resposta = await http.get(Uri.parse(url));
    //Se a busca estiver certa
    if(resposta.statusCode == 200){
      Map<String, dynamic> dado = json.decode(resposta.body);
      setState((){
        conteudo = dado['extract'];
        imagem = dado['originalimage'] ['source'];
      });
    }else{
      //Se houver um erro
      conteudo = 'Nada foi encontrado!';
      imagem = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicativo com Api', style: TextStyle(color:Color.fromARGB(255, 14, 13, 13))),
        backgroundColor: Colors.lime,
      ),
      body: Stack(
        children:[
          // 1 - Representa a imagem de fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.pexels.com/photos/235985/pexels-photo-235985.jpeg?cs=srgb&dl=pexels-pixabay-235985.jpg&fm=jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //2 - Construção do Card
          Padding(
            padding: const EdgeInsets.all(56.0),
            child: Center(
              child: Card(
                color: Color.fromARGB(97, 255, 255, 255),
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget> [
                      Row(
                        children: <Widget>[
                        Expanded(
                          child:  TextField(
                            controller: controleTexto,
                            decoration: const InputDecoration(
                              labelText: 'Digite o texto',
                            ),
                          ),
                        ),
                          ElevatedButton(
                            onPressed: buscar,
                            child: Icon(Icons.search, color: Colors.black),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.lime),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Text('Conclusão:',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold), 
                      ),
                      const SizedBox(height: 10.0),
                      Text(conteudo, style: TextStyle(fontSize: 16.0)),
                      const SizedBox(height: 20),
                      if(imagem.isNotEmpty)
                      GestureDetector(
                        onTap: (){
                          Navigator.push( context, MaterialPageRoute(
                            builder: (context) => ImagemTelaInteira(imagemParametro: imagem),
                            ),
                          );
                        },
                      child: Center(
                        child: Hero(
                          tag: imagem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(imagem, height: 200),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagemTelaInteira extends StatelessWidget{
  final String imagemParametro;
  ImagemTelaInteira({required this.imagemParametro});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: imagemParametro,
          child: Image.network(imagemParametro),
        ),
      ),
    );
  } 
}