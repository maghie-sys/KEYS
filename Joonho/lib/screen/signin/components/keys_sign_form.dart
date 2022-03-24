import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/components/default_button.dart';
import 'package:flutter_application_1/screen/signin/sign_up.dart';

import 'form_error.dart';

class KeysSignForm extends StatefulWidget {
  @override
  _KeysSignFormState createState() => _KeysSignFormState();
}

class _KeysSignFormState extends State<KeysSignForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? id;
  String? password;
  String kIdNull = "아이디를 입력해주세요";
  String kPasswordNull = "비밀번호를 입력해주세요";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildIdlField(),
            SizedBox(height: 12),
            _buildPasswordField(),
            SizedBox(height: 20),
            DefaultButton(
              text: "로그인",
              press: () {
                if (_formKey.currentState!.validate() && errors.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('유효성 검사 확인'),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 10),
            FormError(errors: errors),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: DefaultButton(
                text: "회원가입",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(borderSide: BorderSide(color: color, width: 1));
  }

  TextFormField _buildIdlField() {
    return TextFormField(
      onSaved: (newValue) => id = newValue,
      onChanged: (value) {
        if (value.isNotEmpty & errors.contains(kIdNull)) {
          setState(() {
            errors.remove(kIdNull);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty & !errors.contains(kIdNull)) {
          setState(() {
            errors.add(kIdNull);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        border: outlineInputBorder(Colors.black),
        focusedBorder: outlineInputBorder(Colors.black),
        errorBorder: outlineInputBorder(Colors.black),
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 16, top: 15, bottom: 15),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
        hintText: kIdNull,
      ),
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty & errors.contains(kPasswordNull)) {
          setState(() {
            errors.remove(kPasswordNull);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty & !errors.contains(kPasswordNull)) {
          setState(() {
            errors.add(kPasswordNull);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        border: outlineInputBorder(Colors.black),
        focusedBorder: outlineInputBorder(Colors.black),
        errorBorder: outlineInputBorder(Colors.black),
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 16, top: 15, bottom: 15),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
        hintText: kPasswordNull,
      ),
    );
  }
}
