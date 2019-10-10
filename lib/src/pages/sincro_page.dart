import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:prodesys_mobi/src/utils/alerts.dart';
import 'package:prodesys_mobi/src/utils/network_check.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog pr;

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
    pr = ProgressDialog(context, type: ProgressDialogType.Normal);
    pr.style(message: 'Aguarde...');

    return Scaffold(
      appBar: AppBar(
        title: Text("Sincronizar Dados"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Testando Conexão com Internet"),
              SizedBox(
                height: 20,
              ),
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
                      print("retorno = false");
                      return _botaoSemInternet(context);
                    } else {
                      print("retorno true");
                      return _botaoComInternet(context);
                      //return _seqAtualizacoes(context);
                    }
                  }),
            ],
          ),
        ),
    );
  }

  _botaoSemInternet(context) {
    print("botao Sem Internet");
    return RaisedButton(
        color: Colors.redAccent[200],
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
    return SizedBox(
      height: 80,
          child: RaisedButton(
          color: Colors.blue,
          child: Text(
            "Internet OK, clique para Iniciar",
            style:
                style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            _seqAtualizacoes(context);
          }),
    );
  }


  _seqAtualizacoes(context) async {
    pr.update(message: "Sincronizando ...");
    pr.show();
    await Future.delayed(Duration(seconds: 2)).then((onValue) {
    });
    bool atzOk = false;
    atzOk = await _sincroProdutos(context);
    if(atzOk) {
      atzOk = await _sincroClientes(context);
    }
    pr.hide();
    // testa o status final da atualizacao
    if(atzOk) {
      alert(context, "Sincronização Concluída", "Dados Sicnronizados com o servidor", _retornar(context) );
    } else {
      alert(context, "Sincronização Cancelada", "Ocorreram problemas durante a Sincronização, tente novamente", _retornar(context) );
    }

    

  }

  _retornar(context){
    Navigator.of(context).pop();
  }



  Future<bool> _sincroProdutos(context) async {
    print("sincro Produtos");
    pr.update(message: 'Produtos ...');
    await Future.delayed(Duration(seconds: 3)).then((onValue) {
      print("PR status -produtos");
    });
    return true;
  }



  Future<bool> _sincroClientes(context) async {
    print("sincro Clientes");
    pr.update(message: 'Clientes ...');
   await Future.delayed(Duration(seconds: 3)).then((onValue) {
      print("PR status -clientes");
    });
    return false;
  }




} // fim de tudo
