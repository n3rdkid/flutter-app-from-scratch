import 'package:flutter/material.dart';
import 'package:travel_ui/models/hotel.dart';

class HotelCarousels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Exclusive hotels",
                style: TextStyle(
                    fontSize: 22,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    print("See all");
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        fontSize: 16),
                  ))
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (itemBuilder, idx) {
                Hotel hotel = hotels[idx];
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 210,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 15,
                        child: Container(
                          height: 120,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${hotel.name}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2),
                                  ),
                                  SizedBox(height: 2),
                                  Text("${hotel.address}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      )),
                                  SizedBox(height: 2),
                                  Text("\$${hotel.price}/night",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      )),
                                ]),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 0.2),
                                  blurRadius: 4.0)
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                              height: 180,
                              width: 180,
                              image: AssetImage(hotel.imageUrl),
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
