import 'package:dfree_hub/pages/community.dart';
import 'package:dfree_hub/pages/event.dart';
import 'package:flutter/material.dart';
// Import the expert.dart file

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
                  MaterialPageRoute(builder: (context) => Expert()),
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
            SizedBox(height: 20), // Add some spacing
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, left: 30.0, right: 30.0), // Add padding
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
                            hintStyle:
                                TextStyle(height: 0.5), // Increased height
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 12, bottom: 8),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
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
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                int selectedIndex = 2;

                return Column(
                  children: [
                    Row(
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
                                MaterialPageRoute(
                                    builder: (context) => Event()),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: 105, // Increased width
                              height: 35, // Increased height
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
                                    color: selectedIndex == index
                                        ? Colors.black
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    if (selectedIndex == 0)
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text('News Content'),
                      ),
                    if (selectedIndex == 1)
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Events Content'),
                      ),
                    if (selectedIndex == 2)
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Experts Content'),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
