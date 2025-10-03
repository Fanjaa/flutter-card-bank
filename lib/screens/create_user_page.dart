import 'package:flutter/material.dart';
import 'package:test_app/controller/user_controller.dart';
import 'package:test_app/util/button.dart';

class CreateUserPage extends StatefulWidget {
  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue[800]!
      ..style = PaintingStyle.fill;

    final path = Path();

    // SVG path converted to Flutter (scaled and positioned)
    // translate(100 100) dari SVG = center point
    double centerX = size.width * 0.5;
    double centerY = size.height * 0.5;
    double scale = size.width / 200; // Scale dari viewBox 200x200

    path.moveTo(centerX + (26.8 * scale), centerY + (-49.9 * scale));

    path.cubicTo(
      centerX + (34.4 * scale),
      centerY + (-36.7 * scale),
      centerX + (40.1 * scale),
      centerY + (-28.8 * scale),
      centerX + (51.8 * scale),
      centerY + (-19 * scale),
    );

    path.cubicTo(
      centerX + (63.4 * scale),
      centerY + (-9.3 * scale),
      centerX + (80.9 * scale),
      centerY + (2.4 * scale),
      centerX + (82.1 * scale),
      centerY + (13.6 * scale),
    );

    path.cubicTo(
      centerX + (83.3 * scale),
      centerY + (24.8 * scale),
      centerX + (68.3 * scale),
      centerY + (35.4 * scale),
      centerX + (55 * scale),
      centerY + (43.9 * scale),
    );

    path.cubicTo(
      centerX + (41.8 * scale),
      centerY + (52.4 * scale),
      centerX + (30.5 * scale),
      centerY + (58.7 * scale),
      centerX + (17.1 * scale),
      centerY + (66.3 * scale),
    );

    path.cubicTo(
      centerX + (3.7 * scale),
      centerY + (74 * scale),
      centerX + (-11.7 * scale),
      centerY + (83 * scale),
      centerX + (-26.4 * scale),
      centerY + (82.2 * scale),
    );

    path.cubicTo(
      centerX + (-41.2 * scale),
      centerY + (81.4 * scale),
      centerX + (-55.3 * scale),
      centerY + (70.8 * scale),
      centerX + (-63.6 * scale),
      centerY + (57.3 * scale),
    );

    path.cubicTo(
      centerX + (-71.8 * scale),
      centerY + (43.8 * scale),
      centerX + (-74.1 * scale),
      centerY + (27.4 * scale),
      centerX + (-76.5 * scale),
      centerY + (11 * scale),
    );

    path.cubicTo(
      centerX + (-79 * scale),
      centerY + (-5.5 * scale),
      centerX + (-81.5 * scale),
      centerY + (-21.9 * scale),
      centerX + (-76.1 * scale),
      centerY + (-35.2 * scale),
    );

    path.cubicTo(
      centerX + (-70.7 * scale),
      centerY + (-48.4 * scale),
      centerX + (-57.4 * scale),
      centerY + (-58.5 * scale),
      centerX + (-43.4 * scale),
      centerY + (-68.8 * scale),
    );

    path.cubicTo(
      centerX + (-29.4 * scale),
      centerY + (-79.1 * scale),
      centerX + (-14.7 * scale),
      centerY + (-89.5 * scale),
      centerX + (-2.6 * scale),
      centerY + (-85.5 * scale),
    );

    path.cubicTo(
      centerX + (9.6 * scale),
      centerY + (-81.5 * scale),
      centerX + (19.1 * scale),
      centerY + (-63 * scale),
      centerX + (26.8 * scale),
      centerY + (-49.9 * scale),
    );

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _CreateUserPageState extends State<CreateUserPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final UserController userC = UserController();

  bool isLoading = false;
  String responseText = '';

  void handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
      responseText = '';
    });

    String result = await userC.createPost(
      _titleController.text,
      _bodyController.text,
    );

    setState(() {
      isLoading = false;
      responseText = result;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Create Post'), backgroundColor: Colors.white),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ), // warna saat aktif
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _bodyController,
                    decoration: InputDecoration(
                      labelText: 'Information',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ), // warna saat aktif
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter information content';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Button(
                      text: 'Submit',
                      icon: Icons.send_sharp,
                      color: Colors.white,
                      backgroundColor: Colors.blue[800],
                      side: BorderSide.none,
                      onPressed: handleSubmit,
                    ),
                  ),
                  SizedBox(height: 50),
                  isLoading ? CircularProgressIndicator() : SizedBox(),
                  if (responseText.isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text.rich(
                        TextSpan(
                          // text: 'Response: ', // style default
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          children: [
                            TextSpan(
                              text: responseText, // bagian berbeda
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // TextSpan(
                            //   text: ' ✅', // tambahan icon atau emoji
                            //   style: TextStyle(fontSize: 20),
                            // ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                // Background gradient
                // Container(
                //   height: 120,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     // gradient: LinearGradient(
                //     //   colors: [Colors.blue[400]!, Colors.blue[800]!],
                //     //   begin: Alignment.topLeft,
                //     //   end: Alignment.bottomRight,
                //     // ),
                //     borderRadius: BorderRadius.vertical(
                //       top: Radius.circular(30),
                //     ),
                //   ),
                // ),
                // Blob shape di kiri
                Positioned(
                  left: -190,
                  top: 370,
                  bottom: 0,
                  child: CustomPaint(
                    size: Size(550, 320),
                    painter: BlobPainter(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
