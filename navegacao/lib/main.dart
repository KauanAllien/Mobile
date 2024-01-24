import 'package:flutter/material.dart';
//Método Principal que inicia a ação
void main(){
    runApp(Aplicativo());                //runApp - roda app - Chama classe Aplicativo
}
//A classe Aplicativo vai herdar Stateless - não tem alteração dentro da tela
class Aplicativo extends StatelessWidget{
  //Widget build vai construir a aplicação 
  @override
  Widget build(BuildContext context){
      return MaterialApp(                       //Oferece padrão de design e componentes
      debugShowCheckedModeBanner: false,
        home: Pagina1(),                        //Home - Representa tela inicial - a primeira que abre
      );
  }

}

class Pagina1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold( 
        //Barra de Cima                              //Fornece estruturas Básicas
        appBar: AppBar(
          title: const Text('Página 1', style: TextStyle(color: Colors.white),),                     //Texto dentro da Barra
          backgroundColor: Colors.orange,           //Cor da Barra
        ),
        //Body - corpo - Center - Centralizar(direita-esquerda)
        body: Center(                           //Body - corpo -Center - Centralizar
          child: Column(                             //Organize em sentido coluna
          //Centraliza sentido(acima-abaixo)
          mainAxisAlignment: MainAxisAlignment.center,
              children:[
                //Colocando imagem e personalizando o tamanho
                Image.network('https://cdn.shopify.com/s/files/1/2244/4875/products/maple_2_378349c2-7d18-42cd-8bc5-1a1cb0db5923.png?v=1680182609&width=4024', width: 300, height: 300,),
                
                const Text(
                  'Bem-Vindo a Tela Inicial',
                style: TextStyle(fontSize: 30),
                ),

                const Text(
                'Flutter é uma ferrramenta multiplataforma - Android e IOS com um único código',
                ),
                const SizedBox(height: 20 ),                     //Colocar uma Quebra de Linha LING.HTML <br>

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(                                            //builder - Constroi a nova tela Pagina2  
                      context,                                                 //Identifica página atual
                      MaterialPageRoute(builder: (context) => Pagina2()),       //MaterialPageRoute - define animação e layoult para ir para outra tela 
                    );                                                           //Navigator controla navegações entre telas
                  },                                                                //Push - Empurra uma nova rota, para a pilha de navegação
                  child: Text('Ir para Página 2 '),
                ),
              ],
          ),
        ),
      );
  }
}

class Pagina2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Página 2'), backgroundColor: Colors.red,),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://miro.medium.com/v2/resize:fit:1400/0*P2uaCA_ECZ8Tr1TM', width: 300 , height:300,),
          SizedBox(height: 20),
          Text('Linguagem DART', style: TextStyle(fontSize: 30)),
          Text('uma linguagem versátil que combina eficiência e desempenho , tornando-a uma escolha atraente para o desenvolvimento de aplicativos móveis e web, especialmente com o Framework Flutter.'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pagina3()),
              );
            },
            child: Text('Ir para a Página 3'),
          ),
        ],
      ),
    ),
  );
  }
}
//Sateless informações estaticas = não há mudança
class Pagina3 extends StatelessWidget{
  //build - responsável pela renderização / Construção
    @override
    Widget build(BuildContext context) {
      //Define estruturas de layoult - appbar + body
      return Scaffold(
          appBar: AppBar(
            title: Text('Página 3'),
            backgroundColor: Colors.teal,
            //Action permite adicionar icone a direita 
            actions: [
            //Exibe menu pop-up
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(child: Text('Opção 1'),
                    value: 'opcao1'
                    ),
                    PopupMenuItem(
                      child: Text('Opção 2'),
                      value: 'opcao2',
                    ),
                  ];
                },
                onSelected: (value) {},                           //Ação ao Selecionar opção
              ),
            ],
          ),
          //Corpo do Aplicativo - Centralizando esquerda/Direita
          body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,              //Centralizando acima-baixo
            children: [
              Image.network('https://1.bp.blogspot.com/-IeqZbxezd00/Ubu3CrLAVuI/AAAAAAAAE-k/mMePgQkOtkI/s1600/Final_Fight_Logo_1_a.gif', width: 300, height:300,),
              Text('História do Final Fight ' , style: TextStyle(fontSize: 30),),
              Text('Final Fight é uma série de videogames do gênero beat em up da Capcom, que começou com o lançamento de Final Fight em 1989'),
              SizedBox(height:20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Pagina1()),
              );
            },
            child: Text('Voltar para a Página Inicial'),
          ),
            ],
          ) ,
          ),
      );
    }
}