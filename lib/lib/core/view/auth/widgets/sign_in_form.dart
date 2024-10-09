import 'package:flutter/material.dart';
import 'package:foodly_ui/lib/core/dataModel/auth/login_request.dart';
import 'package:foodly_ui/lib/core/dataModel/auth/login_response.dart';
import 'package:foodly_ui/lib/core/provider/auth_provider.dart';
import 'package:foodly_ui/lib/utils/entry_point.dart';
import 'package:provider/provider.dart';
import '../../../../utils/constants.dart';
import '../../findRestaurants/find_restaurants_screen.dart';
import '../forgot_password_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailController = TextEditingController(text: "rakib@gmail.com");
  final _passwordController = TextEditingController(text: "Asd@12345");
  final _phoneController = TextEditingController(text: "01770995451");
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  void login() async {
    final authProvider = context.read<AuthProvider>();
    authProvider.setLoading(value: true);
    final result = await authProvider.getLogin(
      request: LoginRequest(
        phone: _phoneController.text,
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
    authProvider.setLoading(value: false);
    if (result.token?.isNotEmpty ?? false || result.token == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Successful")));

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const EntryPoint()));
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _phoneController,
            validator: phoneNumberValidator,
            onSaved: (value) {},
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "Phone Number"),
          ),
          const SizedBox(height: defaultPadding),

          TextFormField(
            controller: _emailController,
            validator: emailValidator,
            onSaved: (value) {},
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const SizedBox(height: defaultPadding),

          // Password Field
          TextFormField(
            controller: _passwordController,
            obscureText: _obscureText,
            validator: passwordValidator,
            onSaved: (value) {},
            decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: bodyTextColor)
                    : const Icon(Icons.visibility, color: bodyTextColor),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Forget Password
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ForgotPasswordScreen(),
              ),
            ),
            child: Text(
              "Forget Password?",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  login();
                }
              },
              child: authProvider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white,),
                    )
                  : const Text("Sign in"),
            ),
          ),
        ],
      ),
    );
  }
}
