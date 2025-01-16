import 'package:fire_cars/views/home/add_car_section.dart';
import 'package:fire_cars/views/home/homme_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeAppBar(user: _user),
            AddCarSection(user: _user)
          ],
        )
      )
    );
  }
}