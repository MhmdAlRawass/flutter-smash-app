import 'package:flutter/material.dart';
import 'package:smash/screens/sign_up.dart';
import 'package:smash/widgets/login/button_fields.dart';
import 'package:smash/widgets/login/input_fields.dart';
import 'package:smash/widgets/sign_up/custom_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.onPressedLogin,
  });

  final void Function() onPressedLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final _enteredEmail = TextEditingController();
  final _enteredPassword = TextEditingController();

  void _onPressedLogin() {
    if (_enteredEmail.text.isEmpty || _enteredPassword.text.isEmpty) {
      _showCustomSnackBar('Fields cannot be empty');
    } else if (!_enteredEmail.text.contains('@')) {
      _showCustomSnackBar('Enter a valid email');
    } else {
      widget.onPressedLogin();
    }
  }

  void _showCustomSnackBar(String message) {
    final overlay = OverlayEntry(builder: (context) {
      return Positioned(
        top: MediaQuery.of(context).padding.top,
        left: 0,
        right: 0,
        child: FadeInSnackbar(
          message: message,
          isError: false,
        ),
      );
    });
    Overlay.of(context).insert(overlay);

    Future.delayed(const Duration(seconds: 3), () {
      overlay.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF041AAA),

      //  Theme.of(context).colorScheme.primaryFixedDim,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/bg_login.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'lib/assets/images/logo.webp',
                      width: double.infinity,
                      // height: 250,
                    ),
                    // const SizedBox(
                    //   height: 32,
                    // ),
                    InputFieldLogin(
                      title: 'Email',
                      icon: const Icon(Icons.account_circle_outlined),
                      controller: _enteredEmail,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InputFieldLogin(
                      title: 'Password',
                      icon: const Icon(Icons.lock_outline),
                      controller: _enteredPassword,
                      isPassword: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      side: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: Checkbox.adaptive(
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                    activeColor: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.4),
                                    checkColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    visualDensity: VisualDensity.comfortable,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: 'Remember Password',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Recover Password',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ButtonFieldLogin(
                      onPressed: _onPressedLogin,
                      text: 'LOGIN',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ButtonFieldLogin(
                      onPressed: () async {
                        final TextEditingController firstName =
                            await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) {
                              return const SignUpScreen();
                            },
                          ),
                        );
                        if (firstName.text.isNotEmpty) {
                          _showCustomSnackBar('Welcome ${firstName.text}');
                        }
                      },
                      text: 'SIGN UP!',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
