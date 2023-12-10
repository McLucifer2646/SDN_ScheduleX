import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:schedulex/components/my_button.dart';
import 'package:schedulex/pages/login_or_register_page.dart';
import 'package:schedulex/pages/register_page.dart';

class ProfilePage extends StatefulWidget {
  // final function()? onTap;
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign user out method
  void signUserOut() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signOut();
    Navigator.pop(context);
    // providerData = FirebaseAuth.currentUser?.providerData;
    FirebaseAuth.instance.signOut();
    // Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context)=>
    //                   LoginOrRegisterPage(),
                    
    //               ),
    //             );
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow[200],),
      

      backgroundColor: Colors.yellow[200],
            
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 120,
            backgroundImage: AssetImage("lib/images/profile.png"),
          ),
          const SizedBox(height:10),

           Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              '${user.email!.split('@')[0]}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),

          // const SizedBox(height: ),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              '${user.email!}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 12),


          // Reset pwd button
          MyButton(
            text: 'Sign Out',
            onTap: signUserOut,
          ),
          

          // MaterialButton(
          //   onPressed: passwordReset,
          //   child: Text("Reset Password"),
          //   color: Colors.deepPurple[200],
          // )
        ],
      ),
    );
  }
  
}