import 'package:flutter/material.dart';

import '../../../common/welcome_text.dart';
import '../../../utils/constants.dart';


class ResetEmailSentScreen extends StatelessWidget {
  const ResetEmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeText(
                title: "Reset email sent",
                text:
                    "We have sent a instructions email to \ntheflutterway@email.com."),
            const SizedBox(height: defaultPadding),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Send again"),
            ),
          ],
        ),
      ),
    );
  }
}
