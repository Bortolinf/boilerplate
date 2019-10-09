import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:prodesys_mobi/src/utils/network_check.dart';

class SincroPage extends StatefulWidget {
  @override
  _SincroPageState createState() => _SincroPageState();
}

class _SincroPageState extends State<SincroPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final ConnectionStatusBloc _networkBloc =
      BlocProvider.getBloc<ConnectionStatusBloc>();

  @override
  void initState() {
    super.initState();
    print("initstate");
  }

  @override
  Widget build(BuildContext context) {
    print("antes do scaffold");
    return Scaffold(
      appBar: AppBar(
        title: Text("Sincronizar Dados"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    print("body");
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<bool>(
              stream: _networkBloc.outtemNet,
              initialData: null,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  print("retorno null");
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data == false) {
                  return _botaoSemInternet(context);
                } else  {
                  return _botaoComInternet(context);
                } 
              }),
        ],
      ),
    );
  }

  _botaoSemInternet(context) {
    print("botao Sem Internet");
    return RaisedButton(
        child: Text(
          "Você está sem Conexão, clique para retornar",
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  _botaoComInternet(context) {
    print("botao Com Internet");
    return RaisedButton(
        color: Colors.grey[800],
        child: Text(
          "Você possui internet, parabéns",
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  //_sincroProdutos(context) {}

  //_sincroClientes(context) {}
} // fim de tudo
