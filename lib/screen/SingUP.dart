import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_usingfirebase/data/auth_data.dart';

class SignUp_Screen extends StatefulWidget {
  final VoidCallback show;
  SignUp_Screen(this.show, {super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  bool _isobscure = false;
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();
  final PasswordConfirm = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
    _focusNode3.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
                child: Image.asset(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  'assets/front.jpg',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: TextFormField(
                    focusNode: _focusNode1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please see the label tet and then enter regarding';
                      }
                      return null;
                    },
                    controller: email,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey,
                        prefixIcon: Icon(
                          Icons.email,
                          color: _focusNode1.hasFocus
                              ? Colors.black
                              : Colors.grey[700],
                        ),
                        hintText: 'name',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: TextFormField(
                    focusNode: _focusNode2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please see the label text and then enter regarding';
                      }
                      return null;
                    },
                    controller: password,
                    obscureText: _isobscure,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: _focusNode2.hasFocus
                              ? Colors.black
                              : Colors.grey[700],
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isobscure = !_isobscure;
                              });
                            },
                            icon: Icon(
                              _isobscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            )),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: TextFormField(
                    focusNode: _focusNode3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please see the label text and then enter regarding';
                      }
                      return null;
                    },
                    controller: PasswordConfirm,
                    obscureText: _isobscure,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: _focusNode3.hasFocus
                              ? Colors.black
                              : Colors.grey[700],
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isobscure = !_isobscure;
                              });
                            },
                            icon: Icon(
                              _isobscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            )),
                        hintText: 'ConfirmPassword',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(height: 8),
              account(),
              SizedBox(height: 20),
              SignUP_bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget account() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don you have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget SignUP_bottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote()
              .register(email.text, password.text, PasswordConfirm.text);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
