import 'package:delv/components/my_button.dart';
import 'package:delv/pages/delivery_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void userTappedPay(BuildContext context) {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          
          title:  Text("Confirm payment",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
          content: SingleChildScrollView(
            child: Container(
              
              child: ListBody(
              children: [
                Text("Card Number: $cardNumber",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                ),
                Text("Expiry Date: $expiryDate",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text("Card Holder name: $cardHolderName",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text("CVV: $cvvCode",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
            )
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeliveryProgressPage(),
                ),
              ),
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            
          ),
          child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (p0) {},
              ),
              CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formKey,
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: () {
                  userTappedPay(context);
                },
                text: "Pay now",
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
        )
      ),
    );
  }
}
