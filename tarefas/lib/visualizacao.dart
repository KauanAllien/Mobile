import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas/controle_tarefa.dart';
import 'package:tarefas/modelo_tarefa.dart';

//Função Principal, executa em primeiro lugar
void main(){
  runApp(Principal());
}

class Principal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //Change notifier liga a visualização ao controle tarefa
    //Quando houver alguma alteração no controle, altera a tela
    return ChangeNotifierProvider(
      create: (context) => Controle_tarefa(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App de Tarefas',
        home: telaTarefas(),
      ),
    );

  }

}

class telaTarefas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra de Navegação 
      appBar: AppBar(
        title: Text('App de Tarefas', style: TextStyle(color:Colors.white),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      body: listaTarefas(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          abrirJanelaCadastro(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void abrirJanelaCadastro(BuildContext context){
    //Usado para controlar o textfiled(Campo de inserção de texto editável)
    TextEditingController tarefaControle = TextEditingController();
    //Exibir uma janela 
    showDialog(
      context: context,
      builder: (BuildContext context){
      return AlertDialog(
        title: Text('Adicionar Tarefa'),
        content: TextField(
        controller: tarefaControle,
        decoration: InputDecoration(labelText: 'Titulo da tarefa'),
        ),
        actions: <Widget>[
          TextButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
            ),
            onPressed: () {
              Provider.of<Controle_tarefa>(context, listen: false)
              .adicionar(tarefaControle.text);
              Navigator.pop(context);
            },
            child: Text('Adicionar', style: TextStyle(color:const Color.fromARGB(255, 253, 253, 253))),
          ),
        ],
        );
      },
    );
  }
}

class listaTarefas extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //Para fazer algo com o controle_tarefa
    return Consumer<Controle_tarefa>(
      builder: (context, controle_tarefa, child) {
        //Constroi listas longos ou infinitas e acordo com a demanda 
        return ListView.builder(
          //Informando qual será o tamanho da lista
          itemCount: controle_tarefa.tarefas.length,
          //Constroi um item da lista por vez
            itemBuilder: (context, index){
              Modelo_tarefa modelo_tarefa = controle_tarefa.tarefas[index];
              return ListTile(
                title: Text(modelo_tarefa.titulo),
                leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green, 
                  value: modelo_tarefa.completa,
                  onChanged: (value){
                    Provider.of<Controle_tarefa>(context, listen: false).concluir(index);
                  },
                ),

                trailing: IconButton(
                  icon:Icon(Icons.delete_outline, color: Colors.red),
                  onPressed:(){
                    Provider.of<Controle_tarefa>(context, listen: false).remover(index);
                  },
                ),
              );
            },
        );
      },
    );
  }
}