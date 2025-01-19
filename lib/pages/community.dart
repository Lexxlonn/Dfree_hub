import 'package:dfree_hub/pages/event.dart' as event_page;
import 'package:flutter/material.dart';
import 'package:dfree_hub/pages/expert.dart' as expert_page;

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          title: Center(
            child: Container(
              margin: EdgeInsets.only(right: 16, top: 20, bottom: 5, left: 10),
              width: 110,
              height: 85,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/icon.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Community()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 20.0),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/User Heart.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              height: 40,
              decoration: ShapeDecoration(
                color: Color(0xFFEBEBEB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(height: 0.5),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 12, bottom: 8),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(Icons.tune, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Navigation Tabs
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              int selectedIndex = 0;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => event_page.Event()),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => expert_page.Expert()),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: 105,
                        height: 35,
                        decoration: ShapeDecoration(
                          color: selectedIndex == index ? Colors.white : Color(0xFFD9D9D9),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: selectedIndex == index ? Color(0xFFF6C3C0) : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            index == 0 ? 'News' : index == 1 ? 'Events' : 'Experts',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
          // News Feed
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                // Featured News Card
                Container(
                  height: 200,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("lib/assets/featured-news.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '2 hours ago',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Text(
                          'A ruggedly beautiful destination to explore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Latest News Section
                Text(
                  'Latest news',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                // News List Items
                NewsListItem(
                  title: 'Local community celebration draws record crowds',
                  timestamp: '15 minutes ago',
                  imageAsset: 'lib/assets/news1.jpg',
                ),
                NewsListItem(
                  title: 'New community center opens its doors',
                  timestamp: '1 hour ago',
                  imageAsset: 'lib/assets/news2.jpg',
                ),
                // Add more news items as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsListItem extends StatelessWidget {
  final String title;
  final String timestamp;
  final String imageAsset;

  const NewsListItem({
    required this.title,
    required this.timestamp,
    required this.imageAsset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      timestamp,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.bookmark_border, size: 20, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}