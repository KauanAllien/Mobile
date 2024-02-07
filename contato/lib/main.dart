import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(const Contato());
}

class Contato extends StatelessWidget{
  //Necessário para Inicializar a widget, passa para a classe Pai
  const Contato({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true, 
      ),
      home: const Principal(title:'Contato Pessoal'),
    );
  }
}

class Principal extends StatefulWidget{
  //Passsa parâmetros informações para dentro dessa classe
  const Principal({super.key, required this.title});
  final String title;
//Cria um estado que vai se referir a classe _PrincipalEstado
  @override
  State<Principal> createState() => _PrincipalEstado();
}

//Classe _PrincipalEstado herdando o Estado - Ex: Vai ficar atualizando
class _PrincipalEstado extends State<Principal> {

  final foto = const CircleAvatar(
    backgroundImage: NetworkImage("https://i1.sndcdn.com/artworks-000190322935-sglhw2-t500x500.jpg"),
    radius:150,
  );

  final nome = const Text(
    'Kauan Allien ',
    style: TextStyle(fontSize: 30),
    textAlign: TextAlign.center,
  );

  final obs = const Text(
    'Programador',
    style: TextStyle(fontSize: 20, color: Colors.red),
  );

  final email = IconButton(
    icon: const Icon(Icons.email_outlined),
    color: Colors.green,
    onPressed: (){
      launchUrl(Uri(
        scheme: 'mailto', path: 'kauanallien27@gmail.com',
        queryParameters: {
          'subject' : 'Assunto do email',
          'body' : 'Corpo do Email',
        },
      ));
    },
  );

  final telefone = IconButton(
    icon: const Icon(Icons.phone),
    color: Colors.green,
    onPressed: () {
      launchUrl(Uri(scheme: 'tel' , path: '+5544998843013'));
    },
  );

  final sms = IconButton(
    color: Colors.green,
    icon: const Icon(Icons.message_sharp),
    onPressed: () {
      launchUrl(Uri(scheme: 'sms', path: '+5544998843013'));
    },
  );

  final site = IconButton(
    color:Colors.green,
    icon: const Icon(Icons.open_in_browser_sharp),
    onPressed: () {
      launchUrl(Uri.parse('https://www.linkedin.com/in/kauan-allien-024374281/'));
    },
  );

  final whatsaap = IconButton(
    color: Colors.green,
    icon:const Icon(Icons.wechat),
    onPressed: (){
      launchUrl(Uri.parse('https://api.whatsaap/+5544998843013'));
    },
  );

  final mapa = IconButton(
    icon: const Icon(Icons.map_outlined),
    color: Colors.green,
    onPressed: () {
      launchUrl(Uri.parse('https://maps.app.goo.gl/ALo7WacLyQ28ugY37'));
    },
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text('Aplicativo de Contato' , style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
        leading: IconButton(icon: Icon(Icons.account_box, color: Colors.white), onPressed:() {},), 
      ),
      //Organizar em coluna
      body: Column(
        //Alinhar conteúdo no centro - acima/abaixo
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          foto,
          nome,
          obs,
          //Criando linha
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [email, telefone, sms,site,whatsaap,mapa,],
            //Botões do Aplicativo
          )
        ],
      ),
    );
  }
}

