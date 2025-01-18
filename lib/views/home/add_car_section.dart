import 'package:fire_cars/views/home/show_car_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class AddCarSection extends StatelessWidget {
  final User? user;
  const AddCarSection({
    super.key,
    this.user
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Salut"),
                    Text(
                      user!.displayName!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
            
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300]
                      ),
                      child: IconButton(
                        onPressed: () {}, 
                        icon: Icon(Icons.search)
                      ),
                    ),
            
                    Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.5)
                      ),
                      child: IconButton(
                        onPressed: () {
                          showCarDialog(context, user!);
                        }, 
                        icon: Icon(Icons.add)
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ]
      )
    );
  }
  void showCarDialog(BuildContext context, User user) {
    CarDialog(user: user).showCarDialog(context, ImageSource.gallery);
  }
}