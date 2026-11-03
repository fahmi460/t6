import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFIL"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarGlow(
              endRadius: 120.0,
              glowColor: Colors.red,
              duration: Duration(milliseconds: 2000),
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  backgroundImage: NetworkImage('https://picsum.photos/200'),
                  radius: 60.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Mirza Fahmi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text("4124034"),
          ],
        ),
      ),
    );
  }
}