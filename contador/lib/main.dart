// ignore_for_file: unused_field, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
//Método Principal - O primeiro a ser chamado ao iniciar
void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatefulWidget{
  //Construção de chave, ajuda o flutter a gerenciar as atualizações da tela
  //A chave Key é passada para o construtor da superClasse
  const Aplicativo({Key? key}) : super(key:key);
  //Serve para indicar como criar e associar um estado/alteração - Atualiza Interface
  //State - representa os dados mutáveis de um widget em um momento 
  //Atualiza a tela sempre que houver alterações
  @override
  State<Aplicativo> createState() =>  _EstadoAplicativo();
}
//"_" Na Classe indica que a classe só pode ser acessada neste arquivo
//Estado aplicativo herda as caracteristicas da classe State, que está
//vinculada ao Aplicativo
class _EstadoAplicativo extends State<Aplicativo> {
  //Váriaveis
  int contador1 = 0;
  int contador2 = 0;
  int _tempo = 60;
  late Timer _timer;
  bool _clique = true;                   //Bool de Boolean - verdadeiro ou falso
  Color cor1 = Colors.black;
  Color cor2 = Colors.black;
  double posicao = 0;
  void movimentar(){
    setState((){
      if(contador1 > contador2){
        //Imagem fica na esquerda
        posicao = 50;
      } else if (contador2 > contador1){
        //Imagem fica na direita
        posicao = MediaQuery.of(context).size.width - 150.0;
      }else{
        posicao = MediaQuery.of(context).size.width / 2 - 50 ;
      }
    });
  }
  //Inicia o que estiver dentro, antes mesmo de carregar a tela - inicia o Timer
  @override
  void initState(){
    super.initState();
    _iniciarTimer();
  }
  //Stop Timer - Dispose - Limpa todos os recursos
  void dispose(){
    _timer.cancel();
    super.dispose;
  }
  void _iniciarTimer(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {                                                    //Timer.periodic executa uma função a cada segundo
      setState((){
        if(_tempo > 0){                                                                                    //Se o tempo for menor que zero , diminui 1 (--)
          _tempo--;
        } else {
          _timer.cancel;
          _clique = false;
        }
      }); 
    });
  }
  void _reiniciar(){
    setState(() {                                                                                    //setState - comunica ao Flutter que houve alteração , atualiza toda a tela
      contador1 = 0;
      contador2 = 0;
      _tempo = 60;
      _clique = true;
    });
    _timer.cancel();
    _iniciarTimer();
  }
  void mudarCor(){
    if(contador1 > contador2){
      cor1 = Colors.red;
      cor2 = Colors.black;
    } else if(contador2 > contador1){
      cor1 = Colors.black;
      cor2 = Colors.red;
    } else {
      cor1 = Colors.blue;
      cor2 = Colors.blue;
    } 
  } 
  //Construção do aplicativo - build
  @override
  Widget build(BuildContext context) {
    mudarCor();
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.green,
        // ignore: prefer_const_constructors
        title: Text('Jogo Contador', style:TextStyle(color: Colors.white),),
        ),
        //Corpo do Aplicativo - Body
        //Center - Centralizar esquerda/direita
        body: Stack(
          children: [
        Center(
        //Column - Organizar tudo em colunas - mainAxis centralizar acima/baixo
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //Representa os filhos do widget column
              children: [
                Text('Contador 1: $contador1', style: TextStyle(fontSize: 30, color: cor1),),
                SizedBox(height: 20),
                Text('Contador 2: $contador2', style: TextStyle(fontSize: 30, color:cor2),),
                SizedBox(height: 30),
                Text('Tempo faltando: $_tempo segundos', style: TextStyle(fontSize: 30),),
              ],
            ),
          ),
          AnimatedPositioned( 
            duration: Duration(milliseconds:500),
            bottom: 200.0,
            left: posicao,
            curve:Curves.easeInOut,
            child: Image.network
            ('https://media.tenor.com/Jt4m9-lP4rgAAAAi/running-gif-sonic-the-hedgehog.gif', width:100, height:100,),
          ),
          ],
          ),
          floatingActionButton: Row(                                                     //Define os espaçamentos entre os botões
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Padding(padding: const EdgeInsets.only(left: 50.0),                   //Espaçamento interno ao redor do widget - EdgetInsetsOnly só um lado 
                  child: FloatingActionButton(                                      //Colocando o botão flutuante
                    onPressed: _clique ? () {setState( () {
                      if (_clique == true){
                        contador1++;
                        movimentar();
                      } 
                      contador1++;});} : null,                                      //ALerta que houve alteração , para atualizar a tela
                    tooltip: 'Incrementar Contador 1',                               //contador +1 , adiciona +1 variável contador
                    child: Icon(Icons.add, color: Colors.purple),
                  ),
                ),                         
                FloatingActionButton(onPressed: _reiniciar,
                  tooltip: 'Zerar Contagem',
                  child: Icon(Icons.refresh),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.00),
                  child: FloatingActionButton(
                  onPressed:(){
                    setState((){
                      if(_clique = true ){
                        contador2++;
                        movimentar();
                      }
                    });
                  },
                  tooltip: 'Incrementar contador 2',
                  child: Icon(Icons.add),
                  ),
                ),
              ],
          ),
      ),
    );
  }
}

