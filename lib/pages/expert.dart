import 'dart:math';
import 'package:dfree_hub/pages/community.dart';
import 'package:flutter/material.dart';
import 'event.dart';

class Expert extends StatelessWidget {
  const Expert({super.key});

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
                  MaterialPageRoute(builder: (context) => Event()),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 20, left: 30.0, right: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 380,
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
                            contentPadding:
                                EdgeInsets.only(left: 12, bottom: 8),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFEBEBEB),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.tune,
                              color: const Color.fromARGB(255, 143, 143, 143)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                int selectedIndex = 2; // Set to 2 for Expert tab

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Community()),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Event()),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: 105,
                          height: 35,
                          decoration: ShapeDecoration(
                            color: selectedIndex == index
                                ? Colors.white
                                : Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1,
                                  color: selectedIndex == index
                                      ? Color(0xFFF6C3C0)
                                      : Colors.grey),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              index == 0
                                  ? 'News'
                                  : index == 1
                                      ? 'Events'
                                      : 'Experts',
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

            // Question Card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Struggling with addiction recovery?\nNeed guidance to take the first step?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Get professional advice and support to overcome addiction and start your recovery journey today!',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: Text('Ask a Question'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Recent Discussions Header
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Discussion',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Discussion Posts
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildDiscussionPost(
                      'Elena Marie',
                      'What are some practical steps to overcome addiction? I\'m ready to make a change but need advice on how to get started and stay committed.',
                      '7',
                      '17',
                      '14',
                    ),
                    _buildDiscussionPost(
                      'John Wick',
                      'How do you stay motivated during addiction recovery? I\'m looking for tips and advice to keep pushing forward on tough days.',
                      '36',
                      '26',
                      '23',
                    ),
                    _buildDiscussionPost(
                      'Alexander',
                      'How do you stay motivated during addiction recovery? I\'m looking for tips and advice to keep pushing forward on tough days.',
                      '46',
                      '28',
                      '32',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscussionPost(String name, String content, String likes,
      String comments, String shares) {
    final profilePics = [
      'lib/assets/alexander.png',
      'lib/assets/john.png',
      'lib/assets/elena.png'
    ];
    final random = Random();
    final profilePic = profilePics[random.nextInt(profilePics.length)];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profilePic),
                radius: 20,
              ),
              SizedBox(width: 8),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.thumb_up_outlined, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(likes, style: TextStyle(color: Colors.grey)),
              SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(comments, style: TextStyle(color: Colors.grey)),
              SizedBox(width: 16),
              Icon(Icons.share_outlined, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(shares, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
