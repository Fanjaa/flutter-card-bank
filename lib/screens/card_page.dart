import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/bank_controller.dart';
import 'package:test_app/screens/home_page.dart';
import 'package:test_app/util/card_bank.dart';
import 'package:test_app/util/card_form.dart';
import 'package:test_app/util/exit_app.dart';
import 'package:flutter/services.dart';


class CardPage extends StatefulWidget {
  final String typeCard;
  final String bankName;
  CardPage({super.key, required this.typeCard, required this.bankName});
  final BankController controller = Get.put(BankController());

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    int _currentIndex = 1;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (ExitAppUtil.handlePopInvoked()) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true, // agar keyboard tidak menutupi
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            currentIndex: _currentIndex, // state untuk tab aktif
            onTap: (index) {
              if (index == 0) {
                // misal Card tab
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } else {
                setState(() {
                  _currentIndex = index; // tab lainnya
                });
              }
            },
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue[800],
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_outlined),
                label: 'Card',
              ),
              // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Bagian Card
              CardBank(typeCard: widget.typeCard),
              // Bagian putih bawah (form)
              Expanded(child: CardForm(bankName: widget.bankName)),
            ],
          ),
        ),
      ),
    );
  }
}
