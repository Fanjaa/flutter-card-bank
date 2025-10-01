import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/bank_controller.dart';


class CardForm extends StatefulWidget {
  final String bankName;
  const CardForm({super.key, required this.bankName});

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final _formKey = GlobalKey<FormState>();
  late final BankController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<BankController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  widget.bankName,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Text(
                  'Card Number',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: '1234 5678 9101 1213',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                ),
                onChanged: (val) => controller.cardNumber.value = val,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your card number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Text(
                  'Card Holder Name',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Input Your Cardholder Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                ),
                onChanged: (val) => controller.cardholder.value = val,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your cardholder name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Text(
                  'Expired Date',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '10/29',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                ),
                // onChanged: (val) => controller.expiredDate.value = val,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter your expired date';
                //   }
                //   return null;
                // },
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Text(
                  'CVV',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'xxx',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                ),
                // onChanged: (val) => controller.cvv.value = val,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter your CVV';
                //   }
                //   return null;
                // },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();

                        // Reset controller GetX
                        controller.cardNumber.value = '';
                        controller.cardholder.value = '';
                        // controller.cardNumberDisplay.value =
                        //     ''; // Jika pakai debounce
                        // controller.cardholderDisplay.value =
                            ''; // Jika pakai debounce

                        // Tampilkan snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form Cancelled')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.blue, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.blue[800]),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Submitting form')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
