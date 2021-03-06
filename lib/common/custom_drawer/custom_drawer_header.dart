import 'package:busaca/models/user_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: Consumer<UserManager>(
          builder: (_, userManager, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Busaca\nStore',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Ola, ${userManager.user?.name ?? ''}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (userManager.isLoggedIn){
                      userManager.signOut();
                    } else {
                      Navigator.of(context).pushNamed('/login');
                    }
                  },
                  child: Text(
                    userManager.isLoggedIn
                        ? 'Sair'
                        :'Entre ou Cadastre-se',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )// se o usuario não estiver logado sera vazio
              ],
            );
          }
      )
    );
  }
}
