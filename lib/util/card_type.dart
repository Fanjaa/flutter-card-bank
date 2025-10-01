import 'package:flutter/material.dart';
import 'package:test_app/screens/card_page.dart';

class CardType extends StatelessWidget {
  final icon;
  final color;
  final String typeCard;
  final String bankName;

  const CardType({
    Key? key,
    required this.color,
    required this.icon,
    required this.typeCard,
    required this.bankName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Pindah ke halaman baru
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardPage(
                typeCard: typeCard,
                bankName: bankName,
              ),
            ),
          );
        },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), 
              spreadRadius: 0, 
              blurRadius: 4,   
              offset: Offset(0, 3), 
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: color,
                    child: Icon(icon, color: Colors.white),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      typeCard,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      bankName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.more_horiz),
          ],
        ),
      ),
    )
    );
  }
}
