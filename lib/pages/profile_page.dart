import 'package:flutter/material.dart';
import 'package:planearth/widgets/home_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HomeText(
          value: "Profile Page",
          colorFont: Colors.black,
          sizeFont: 18.0,
        ),
      ),
    );
  }
}
