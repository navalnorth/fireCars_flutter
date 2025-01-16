import 'package:fire_cars/services/authentification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class ProfileAppBar extends StatelessWidget {
  final User? user;

  const ProfileAppBar({
    super.key,
    this.user
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(user?.photoURL ?? 'https://via.placeholder.com/150'),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient
              (colors: [
                Colors.white, Colors.transparent
              ],
              begin: Alignment.bottomRight
              ),
            ),
          ),
        ),

        titlePadding: EdgeInsets.only(left: 80, bottom: 8),
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "${user?.displayName}\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              TextSpan(
                text: "${user?.email}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                )
              )
            ]
          )
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            signOut(context);
          }, 
          icon: Icon(Icons.logout)
        )
      ],
    );
  }
  signOut (BuildContext context) {
    Navigator.of(context).pop();
    AuthService().signOut();
  }
}