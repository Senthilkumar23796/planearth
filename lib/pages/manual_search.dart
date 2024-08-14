import 'package:flutter/material.dart';
import 'package:planearth/widgets/home_text.dart';

class ManualSearch extends StatefulWidget {
  const ManualSearch({super.key});

  @override
  State<ManualSearch> createState() => _ManualSearchState();
}

class _ManualSearchState extends State<ManualSearch> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HomeText(sizeFont: 18.0, colorFont: Colors.black, value: "Manual Search"),
      ),
    );
  }
}
