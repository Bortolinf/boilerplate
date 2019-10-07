import 'package:flutter/material.dart';
import 'package:prodesys_mobi/src/db/my_database.dart';

class ClientesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // temporario para testar registros
    MyDatabase.instance.addCliente(Cliente(id: 1, nome: "joaozinho de Deus"));
    MyDatabase.instance.addCliente(Cliente(id: 2, nome: "Maria Bonita"));


    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes") ,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: (){
            // teste de update
            MyDatabase.instance.updateCliente((Cliente(id: 1, nome: "joaozinho Troca Nome")));
          },)
        ],
        ),
        body: _body(context),
    );
  }

_body(context) {
  return StreamBuilder<List<Cliente>>(
    initialData: [],
    stream: MyDatabase.instance.getAllClientes(),
    builder: (context, snapshot) {
      if(!snapshot.hasData)
      return Center(
        child: CircularProgressIndicator(),
      );
      else if(snapshot.data.length == 0)
      return Center(
        child: Text("Nenhum cliente Cadastrado"),
         );
      else   
       return
       ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index){
          Cliente cli = snapshot.data[index];
          return ListTile(
            title: Text(cli.nome),
            subtitle: Text(cli.id.toString()),
            leading: IconButton(icon: Icon(Icons.delete),onPressed: (){
              MyDatabase.instance.deleteCliente(cli.id);
            },),
          );
        },
      );
    }
  ,);
}

} // fim de tudo