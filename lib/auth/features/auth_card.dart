import 'package:assist_teacher/auth/auth_fb/auth_fb.dart';
import 'package:assist_teacher/colors.dart';
import 'package:assist_teacher/models/http_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

enum AuthMode { signUp, logIn }

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.logIn;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  get authData => _authData;
  var _isLoading = false;
  final _passwordController = TextEditingController();
  AnimationController? _controller;
  Animation<Size>? _heightAnimation;
  Animation<Offset>? _slideAnimation;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _heightAnimation = Tween<Size>(
      begin: const Size(double.infinity, 260),
      end: const Size(double.infinity, 320),
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeIn,
      ),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1.5), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeIn,
      ),
    );
    _heightAnimation!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('An Error Occured!'),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('Okay'),
                )
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.logIn) {
        // Log user in
        AuthFB(FirebaseAuth.instance, FirebaseFirestore.instance).login(
          context: context,
          email: _authData['email'] as String,
          password: _authData['password'] as String,
        );
      } else {
        // Sign user up
        // print(_authData['email'] as String);
        AuthFB(FirebaseAuth.instance, FirebaseFirestore.instance).signup(
          context: context,
          email: _authData['email'] as String,
          password: _authData['password'] as String,
        );
      }
      // Navigator.of(context).pushReplacementNamed('/products-overview');
    } on HttpException catch (error) {
      var errorMessage = 'Authentication Failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This Email address is already in use';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email adsress';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weeek';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find the user with this email';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'INVALID PASSWORD';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Could not authenticate you .try again later';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.logIn) {
      setState(() {
        _authMode = AuthMode.signUp;
      });
      _controller!.forward();
    } else {
      setState(() {
        _authMode = AuthMode.logIn;
      });
      _controller!.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: MyColors.myWhite,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-Mail',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Invalid email!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _authData['email'] = value!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: MyColors.myWhite,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 5) {
                    return 'Password is too short!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _authData['password'] = value!;
                },
              ),
            ),
            // if (_authMode == AuthMode.signUp)
            AnimatedContainer(
              constraints: BoxConstraints(
                minHeight: _authMode == AuthMode.signUp ? 60 : 0,
                maxHeight: _authMode == AuthMode.signUp ? 120 : 0,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              child: FadeTransition(
                opacity: _opacityAnimation!,
                child: SlideTransition(
                  position: _slideAnimation!,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: MyColors.myWhite,
                    child: TextFormField(
                      enabled: _authMode == AuthMode.signUp,
                      decoration:
                          const InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: _authMode == AuthMode.signUp
                          ? (value) {
                              if (value != _passwordController.text) {
                                return 'Passwords do not match!';
                              }
                              return null;
                            }
                          : null,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _submit,
                style: ButtonStyle(
                  maximumSize: MaterialStateProperty.all(
                      Size(deviceSize.width * 0.95, 50)),
                  minimumSize: MaterialStateProperty.all(
                      Size(deviceSize.width * 0.9, 45)),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                  ),
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      style: BorderStyle.solid,
                      // color: Colors.black54,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  _authMode == AuthMode.logIn ? 'LOGIN' : 'SIGN UP',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    // backgroundColor: Theme.of(context).primaryColor,
                    color: MyColors.myWhite,
                  ),
                ),
              ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
              child: TextButton(
                onPressed: _switchAuthMode,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  '${_authMode == AuthMode.logIn ? 'SIGNUP' : 'LOGIN'} INSTEAD',
                  style: const TextStyle(
                      color: MyColors.myWhite, letterSpacing: 4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
