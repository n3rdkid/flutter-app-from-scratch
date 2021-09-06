import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/activity.dart';
import 'package:travel_ui/models/destination.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({required this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  _buildRatingStar(int rating) {
    String stars = "";
    for (int i = 0; i < rating; i++) {
      stars += "⭐ ";
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0)
                  ]),
              child: Hero(
                tag: widget.destination.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    widget.destination.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                      icon: Icon(
                        Icons.arrow_back,
                      )),
                  Row(
                    children: [
                      IconButton(
                          iconSize: 30,
                          onPressed: () {},
                          color: Colors.black,
                          icon: Icon(
                            Icons.search,
                          )),
                      IconButton(
                          iconSize: 25,
                          onPressed: () {},
                          color: Colors.black,
                          icon: Icon(
                            FontAwesomeIcons.sortAmountDown,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.city,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                  ),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.locationArrow,
                          size: 15, color: Colors.white70),
                      SizedBox(width: 10),
                      Text(
                        widget.destination.country,
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 25,
                ))
          ],
        ),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                itemCount: widget.destination.activities.length,
                itemBuilder: (itemBuilder, idx) {
                  Activity activity = widget.destination.activities[idx];
                  return Stack(
                    children: [
                      Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.only(
                            left: 40, top: 5, bottom: 5, right: 20),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 120,
                                    child: Text(activity.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Column(
                                    children: [
                                      Text("\$${activity.price}",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600)),
                                      Text("per pax",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  )
                                ],
                              ),
                              Text(activity.type,
                                  style: TextStyle(color: Colors.grey)),
                              _buildRatingStar(activity.rating),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(activity.startTimes[0]),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(activity.startTimes[1]),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        top: 15,
                        left: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(activity.imageUrl,
                              width: 110, fit: BoxFit.cover),
                        ),
                      )
                    ],
                  );
                })),
      ],
    ));
  }
}
