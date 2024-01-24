import 'package:flutter/material.dart';

void main(){                                              //A onde a execução do programa começa - Principal
  runApp(const Aplicativo());                                               //Executa aplicativo 
}
//Classe Aplicativo (contém caracteristicas variaves e funções)
//Extends - extende - Herda caracteristicas do widget stateless
//Stateless - toda interface é imutável após a criação
class Aplicativo extends StatelessWidget {                         //
  const Aplicativo({super.key});                                  //Classe Pai
  
  
  @override                                                    //Build - Metodo que reconstroi a tela  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(                                         //AppBar é a cor da barra superior
          backgroundColor: Colors.purple,                     //Cor de fundo da barra
          title: const Text('Flutter é estiloso!',             //Coloca o titulo - Texto na Barra e o texto que você quer entre aspas
            style: TextStyle(color: Colors.white),           // Alterar a cor do Texto
          ), 
        ),
        //Body é o corpo do App , Center vai centralizar o conteúdo
        body: const Center(
          //Child representa que é filho do widget Center - SizedBox - CaixaComTamanho
          child: SizedBox(
            child: const Text('Flutter foi desenvolvido pela Google e usa a linguagem DART',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'arial',
              ),
            ),
            height: 300,                   //Altura da Caixa
            width: 300,                    //Largura da Caixa
          ),
        ),                                       
        //Botão flutuante no canto direito abaixo                                          
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,         //Alterar cor do Botão
          child: Icon(Icons.add),                   //Icone do Botão                 
          onPressed: () {} ),                            //Ação quando clicar

        bottomNavigationBar: BottomNavigationBar(items: const[                        //BottomNavigationBarItem - é o item da barra de Navegação
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Negócios'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Escola'),
        ]),          //Barra de Navegação Inferior

        // ---- Barra Lateral do Aplicativo
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: <Widget> [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'Menu App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(                                              //Item do Menu
                leading: const Icon(Icons.home),                      //Icone do item do Menu
                title: Text('Página Principal'),                       //Título do item do Menu
                onTap: () {},                                            //Ação que o botão irá executar  
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('configurações'),
                onTap: () {}
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Perfil'),
                onTap: () {}
              ),

            ],
          ),                      //Lista dos itens do Menu
        ),
      ),                                                      //Widget responsável pelo design da aplicação , formação de temas e recursos
    );
  }                                                         //Ignore: prefer_const_constructors    
}                                                             //Extends - extende - Herda características do widget stateless
                        