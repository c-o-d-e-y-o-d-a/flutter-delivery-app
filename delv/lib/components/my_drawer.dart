import 'package:delv/services/auth/auth_service.dart';
import 'package:delv/pages/home_page.dart';
import 'package:delv/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:delv/components/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    
    final _authService = AuthService();
    _authService.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Padding(
              padding:const EdgeInsets.only(top:100.0),
              child:Icon(
                Icons.lock_open_rounded,
                size:80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            Padding(
              padding:const EdgeInsets.all(25.0) ,
              child: Divider(
                color: Theme.of(context).colorScheme.secondary),
              ),

              
              
              MyDrawerTile(
                text: "H O M E",
                icon: Icons.home,
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const HomePage(),));
                }),


                MyDrawerTile(
                text: "S E T T I N G S",
                icon: Icons.settings,
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const settingsPage(),));
                }),

                const Spacer(),//fills all space in bw

                MyDrawerTile(
                text: "L O G O U T",
                icon: Icons.logout,
                onTap: (){

                  try{
                    logout();
                  }
                  catch(e){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(e.toString()),
                          ));
                  }


                  
                }),

                const SizedBox(height: 25,),
          ]));
  }
}
