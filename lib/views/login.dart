import 'package:fire_cars/services/authentification.dart';
import 'package:flutter/material.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoginProcess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage("assets/fire_car.png"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const Text(
                "Fire Cars",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),

              const Text(
                "Découvrez et partagez les \n meilleurs voitures de luxes \n de 2021",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height: 40,
              ),
              
              isLoginProcess ? Center(child: CircularProgressIndicator()) : 
              ElevatedButton(
                onPressed: () {
                  signin();
                }, 
                child: 
                  Text("Connectez-vous avec Google"),
                  // style: ButtonStyle(
                  //   shape: WidgetStatePropertyAll(
                  //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  //   ),
                  //   backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  //   foregroundColor: WidgetStatePropertyAll(Colors.black),
                  // ),
              )
            ],
          ),
        )
      ),
    );
  }
  signin() {
    setState(() {
      isLoginProcess = true;
      AuthService().signInWithGoogle();
    });
  }
}