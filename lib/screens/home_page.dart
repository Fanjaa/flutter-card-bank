import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/util/emoticon_face.dart';
import 'package:test_app/util/card_type.dart';
import 'package:test_app/util/exit_app.dart';
import 'package:test_app/util/bottom_navigation.dart';
import 'package:test_app/widgets/clock_widget.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? cardholder;
  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  void loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cardholder = prefs.getString('holderName');
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    int _currentIndex = 0;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (ExitAppUtil.handlePopInvoked()) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue[800],
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigation(currentIndex: _currentIndex,)
        ),
        body: SafeArea(
          child: Stack(
            children: [
              // Bagian Biru Atas (Fixed)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      // Greeting Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // HI Fanjaa
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // 'Hi, Fanjaa!',
                                'Hi, ${cardholder ?? 'Users'}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              const ClockWidget(),
                            ],
                          ),
                          // Notification
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[500],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.all(12),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      // Search Bar
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 3,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.white),
                            SizedBox(width: 5),
                            // Text('Search', style: TextStyle(color: Colors.white)),
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Search...",
                                  hintStyle: TextStyle(color: Colors.white70),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 25),

                      // How Do You Feel
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'How do you feel?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.more_horiz, color: Colors.white),
                        ],
                      ),

                      SizedBox(height: 25),

                      // 4 Different Faces
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Bad
                          Column(
                            children: [
                              EmoticonFace(emoticonFace: '😒'),
                              SizedBox(height: 8),
                              Text(
                                'Bad',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),

                          // Fine
                          Column(
                            children: [
                              EmoticonFace(emoticonFace: '😊'),
                              SizedBox(height: 8),
                              Text(
                                'Fine',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),

                          // Well
                          Column(
                            children: [
                              EmoticonFace(emoticonFace: '😁'),
                              SizedBox(height: 8),
                              Text(
                                'Well',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),

                          // Excelent
                          Column(
                            children: [
                              EmoticonFace(emoticonFace: '😎'),
                              SizedBox(height: 8),
                              Text(
                                'Excelent',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),

              // Bagian Putih Bawah (Draggable - max 80%)
              DraggableScrollableSheet(
                initialChildSize: 0.5, // Posisi awal 50% dari tinggi layar
                minChildSize: 0.5, // Minimal tetap di 50%
                maxChildSize: 0.78, // Maksimal naik sampai 80%
                builder:
                    (BuildContext context, ScrollController scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, -5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Handle bar untuk indikator drag
                            SizedBox(height: 10),
                            Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            SizedBox(height: 15),

                            // Exercise Heading
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Card List',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Icon(Icons.more_horiz),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),

                            // ListView Of Exercise
                            Expanded(
                              child: ListView(
                                controller: scrollController,
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                children: [
                                  CardType(
                                    icon: Icons.payments_outlined,
                                    color: Colors.red,
                                    typeCard: "Debit Card",
                                    bankName: "BCA",
                                  ),
                                  CardType(
                                    icon: Icons.payments_outlined,
                                    color: Colors.blue,
                                    typeCard: "Debit Card",
                                    bankName: "BRI",
                                  ),
                                  CardType(
                                    icon: Icons.credit_card,
                                    color: Colors.green,
                                    typeCard: "Credit Card",
                                    bankName: "VISA",
                                  ),
                                  CardType(
                                    icon: Icons.credit_card,
                                    color: Colors.orange,
                                    typeCard: "Credit Card",
                                    bankName: "MasterCard",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
