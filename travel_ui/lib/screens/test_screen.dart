import 'package:flutter/material.dart';

class SellerDetails extends StatelessWidget {
  final onBackTap;
  const SellerDetails({
    Key? key,
    required this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Stack(children: [
        Container(
          width: double.infinity,
          height: 300,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.network(
                "https://images.unsplash.com/photo-1632119653689-2b0d6a70515d?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8dG93SlpGc2twR2d8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1200&q=60"),
          ),
        ),
        Positioned(
          left: 24,
          child: SafeArea(
            child: GestureDetector(
              onTap: onBackTap,
              child: Container(
                  color: Colors.red, height: 20, width: 20, child: Text("Y")),
            ),
          ),
        ),
      ]),
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xff00002f),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            child: Container(color: Colors.white),
          ),
        ),
      ),
    ]));
  }
}
