import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/destination_carousel.dart';
import 'package:travel_ui/widgets/hotels_carousels.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIdx = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  _buildIcons(int idx) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIdx = idx;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: _selectedIdx == idx
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(_icons[idx],
            size: 25,
            color: _selectedIdx == idx
                ? Theme.of(context).primaryColor
                : Color(0xFFB4C1C4)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 120),
            child: Text(
              "What would you like to find?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map<Widget>((e) => _buildIcons(e.key))
                .toList(),
          ),
          SizedBox(height: 20),
          DestinationCarousel(),
          HotelCarousels()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
              tooltip: "Search",
              label: "",
              icon: Icon(
                Icons.search,
                size: 30,
              )),
          BottomNavigationBarItem(
              tooltip: "Pizza",
              label: (""),
              icon: Icon(
                Icons.local_pizza,
                size: 30,
              )),
          BottomNavigationBarItem(
              tooltip: "Pizza",
              label: (""),
              icon: CircleAvatar(
                radius: 15,
                child: ClipRRect(
                  child: Image.asset("assets/images/grey.jpeg"),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ))
        ],
      ),
    );
  }
}
