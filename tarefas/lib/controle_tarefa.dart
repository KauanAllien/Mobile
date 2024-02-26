// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:tarefas/modelo_tarefa.dart';
//Change motifier comunica todos os widgets que houve mudança
// ignore: camel_case_types
class Controle_tarefa extends ChangeNotifier{
  //Criando listas de tarefas 
  List <Modelo_tarefa> tarefas = [];
  //Adicionar uma nova Tarefa 
  void adicionar(String conteudo){
    tarefas.add(Modelo_tarefa(titulo: conteudo));
    notifyListeners();
  }
  //Excluir tarefa 
  void remover(int id){
    tarefas.removeAt(id);
    notifyListeners();
  }

  //Método para concluir uma tarefa ou não
  void concluir(int id){
    tarefas[id].completa = !tarefas[id].completa;
    notifyListeners();
  }

}