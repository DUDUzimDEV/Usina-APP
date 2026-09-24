import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_page.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  bool cadastroAberto = false;

  Future<void> sair() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loginRealizado', false);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usina App'),
      ),
      drawer: Drawer(
        child: montarMenu(),
      ),
      body: const Center(
        child: Text('Tela Principal'),
      ),
    );
  }

  Widget montarMenu() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          child: Text('Menu Principal'),
        ),
        const ListTile(
          leading: Icon(Icons.home),
          title: Text('Início'),
        ),
        ListTile(
          leading: const Icon(Icons.app_registration),
          title: const Text('Cadastro'),
          trailing: Icon(
            cadastroAberto ? Icons.expand_less : Icons.expand_more,
          ),
          onTap: () {
            setState(() {
              cadastroAberto = !cadastroAberto;
            });
          },
        ),
        if (cadastroAberto) ...[
          const ListTile(
            title: Text('Unidade'),
            contentPadding: EdgeInsets.only(left: 48),
          ),
          const ListTile(
            title: Text('Setor'),
            contentPadding: EdgeInsets.only(left: 48),
          ),
          const ListTile(
            title: Text('Equipamento'),
            contentPadding: EdgeInsets.only(left: 48),
          ),
          const ListTile(
            title: Text('Indicador'),
            contentPadding: EdgeInsets.only(left: 48),
          ),
          const ListTile(
            title: Text('Funcionário'),
            contentPadding: EdgeInsets.only(left: 48),
          ),
          const ListTile(
            title: Text('Tipo de Medição'),
            contentPadding: EdgeInsets.only(left: 48),
          ),
          const ListTile(
            title: Text('Parâmetro'),
            contentPadding: EdgeInsets.only(left: 48),
          ),
        ],
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Sair'),
          onTap: () {
            Navigator.pop(context);
            sair();
          },
        ),
      ],
    );
  }
}


