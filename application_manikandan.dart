import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi, David 👋",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Explore the world",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/150?img=3"), // placeholder profile
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Search bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search places",
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.tune, color: Colors.grey),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Popular places",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("View all", style: TextStyle(color: Colors.blue)),
                ],
              ),

              const SizedBox(height: 12),


              Row(
                children: [
                  _buildTab("Most Viewed", true),
                  const SizedBox(width: 10),
                  _buildTab("Nearby", false),
                  const SizedBox(width: 10),
                  _buildTab("Latest", false),
                ],
              ),

              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _placeCard(
                      imageUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/1/12/Mount_Fuji_from_Hotel_Mt_Fuji_1995-1-1.jpg",
                      title: "Mount Fuji, Tokyo",
                      location: "Tokyo, Japan",
                      rating: 4.8,
                    ),
                    _placeCard(
                      imageUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/5/57/Torres_del_Paine_mountains.jpg",
                      title: "Andes, South America",
                      location: "South America",
                      rating: 4.6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Fav"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: "Notifications"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }

  // Tab button
  static Widget _buildTab(String text, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Place Card
  static Widget _placeCard({
    required String imageUrl,
    required String title,
    required String location,
    required double rating,
  }) {
    return Container(
        margin: const EdgeInsets.only(right: 16),
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
            children: [
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: Icon(Icons.favorite_border, color: Colors.red),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text(location,
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 12)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.yellow, size: 16),
                              Text(rating.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
            ),
        );
  }
}
