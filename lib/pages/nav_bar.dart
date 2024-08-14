import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planearth/widgets/home_text.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            Divider(color: Colors.grey,indent: 20.0,endIndent: 20.0,thickness: 2.0,),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
      child: const Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 52.0,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            const SizedBox(width: 15.0,),
            HomeText(
                sizeFont: 15.03, colorFont: Colors.black, value: "Anu Karthik"),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24.0),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.user,color: Colors.black,),
            title: const HomeText(
              sizeFont: 14.0,
              colorFont: Colors.black,
              value: "Account Setting",
            ),
            splashColor: Colors.white,
            onTap: () {},
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.bell,color: Colors.black,),
            title: const HomeText(
              sizeFont: 14.0,
              colorFont: Colors.black,
              value: "Notifications",
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.fileLines,color: Colors.black,),
            title: const HomeText(
              sizeFont: 14.0,
              colorFont: Colors.black,
              value: "About us",
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.arrowRightFromBracket,color: Colors.black,),
            title: const HomeText(
              sizeFont: 14.0,
              colorFont: Colors.black,
              value: "Logout",
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
