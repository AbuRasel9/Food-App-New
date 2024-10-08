import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly_ui/lib/core/view/auth/widgets/sign_in_form.dart';
import '../../../common/buttons/socal_button.dart';
import '../../../common/welcome_text.dart';
import '../../../utils/constants.dart';
import '../../../utils/entry_point.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(
                title: "Welcome to Hewkai",
                text: "Login to Continue",
              ),
              SizedBox(height: defaultPadding),

              SignInForm(),
              // Google
              /*SocalButton(
                press: () async {

                },
                text: "Connect with Google",
                color: const Color(0xFF4285F4),
                icon: SvgPicture.asset(
                  'assets/icons/google.svg',
                ),
              ),*/
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
