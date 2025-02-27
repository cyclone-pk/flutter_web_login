import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_login_screen/style/color.dart';
import 'package:flutter_web_login_screen/style/text_styles.dart';
import 'package:flutter_web_login_screen/ui/widgets/custom_text_field.dart';
import 'package:flutter_web_login_screen/ui/widgets/grid_bg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool password = true;
  bool rememberMe = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          GridBackground(),
          Container(
            padding: EdgeInsets.all(20),
            width: 350,
            decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign in to continue',
                    style: CustomTextStyle.header,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    required: true,
                    hintText: 'Email',
                    onValidate: () {
                      if (!emailController.text.contains("@") ||
                          !emailController.text.contains(".")) {
                        return "Please enter valid email address";
                      }
                    },
                    controller: emailController,
                    verticalPadding: 15,
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      CustomTextField(
                        required: true,
                        hintText: 'Password',
                        controller: passwordController,
                        verticalPadding: 15,
                        maxLine: 1,
                        password: password,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: IconButton(
                            onPressed: () {
                              password = !password;
                              setState(() {});
                            },
                            icon: Icon(password
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          rememberMe = !rememberMe;

                          setState(() {});
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: CustomTheme.accentColor,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                  child: rememberMe
                                      ? Icon(
                                          Icons.check,
                                          color: CustomTheme.textField,
                                          size: 15,
                                        )
                                      : SizedBox()),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Remember me',
                              style: CustomTextStyle.regular
                                  .copyWith(color: CustomTheme.accentColor),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Forgot Password?',
                          style: CustomTextStyle.regular.copyWith(
                              color: CustomTheme.white.withValues(alpha: .5)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: CustomTheme.accentColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: Text(
                      "Login",
                      style: CustomTextStyle.regular,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Don\'t have an account?  ',
                            style: CustomTextStyle.regular,
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        TextSpan(
                            text: 'Sign up',
                            style: CustomTextStyle.regular.copyWith(
                              color: CustomTheme.accentColor,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
