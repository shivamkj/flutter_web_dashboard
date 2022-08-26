import 'package:flutter/material.dart';
import 'package:web_dashboard/modals/user.dart';
import 'package:web_dashboard/utils/constants.dart';
import 'package:web_dashboard/widgets/text_input.dart';

import '../main.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 640,
            width: 1080,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            child: Row(
              children: [
                PaymentForm(),
                if (MediaQuery.of(context).size.width > 900)
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff20BF55), Color(0xff01BAEF)],
                          stops: [0.0, 1.0],
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          tileMode: TileMode.repeated,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentForm extends StatelessWidget {
  PaymentForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _formData = UserDetails(name: '', email: '', password: '', city: '');

  @override
  Widget build(BuildContext context) {
    final toBuyquantity = App.preferences.getInt(buyQuantity)!;

    return Form(
      key: _formKey,
      child: Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Payment",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 18),
                Text(
                  "Price: ${toBuyquantity * 20}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 28),
                TextInput(
                  'Card Holder Name',
                  'Your Name (as wriiten on the Card)',
                  onSaved: (value) => _formData.email = value ?? '',
                ),
                TextInput(
                  'Card Number',
                  '1234 5678 9012 3456',
                  onSaved: (value) => _formData.password = value ?? '',
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextInput(
                        'Card Expiry',
                        'MM/YY',
                        onSaved: (value) => _formData.city = value ?? '',
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: TextInput(
                        'CVV',
                        'xxx',
                        onSaved: (value) => _formData.city = value ?? '',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                MaterialButton(
                  onPressed: () {
                    final bought = App.preferences.getInt(boughtQuantity)!;
                    App.preferences.setInt(boughtQuantity, bought + toBuyquantity);
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(Routes.dashBoardHome, (route) => false);
                  },
                  minWidth: double.infinity,
                  height: 54,
                  elevation: 12,
                  color: Colors.green.shade600,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  child: const Text("Make payement"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
