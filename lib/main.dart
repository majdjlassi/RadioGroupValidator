import 'package:flutter/material.dart';
import 'package:validatorTest/custom_radio_group.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Gender { None, Male, Female }

class _MyHomePageState extends State<MyHomePage> {
  Gender _selectedGender = Gender.None;

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Valid input"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Buttons validators"),
      ),
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: "jlmajd3@gmail.com",
                autofocus: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                validator: (value) {
                  if (value.isEmpty) return "Please enter your email";
                  return null;
                },
              ),
              SizedBox.fromSize(size: Size.fromHeight(4.0)),
              TextFormField(
                initialValue: "Azerty",
                autofocus: false,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                validator: (value) {
                  if (value.isEmpty) return "Please enter your email";
                  return null;
                },
              ),
              SizedBox.fromSize(size: Size.fromHeight(4.0)),
              RadioGroup<Gender>(
                initialValue: Gender.None,
                validator: (Gender gender) {
                  if (gender == Gender.None) {
                    return "please select your gender !";
                  }
                  return null;
                },
                errorTextStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 15.0,
                ),
                radioButtons: [
                  RadioListTile<Gender>(
                    title: const Text('Male'),
                    value: Gender.Male,
                    groupValue: _selectedGender,
                    onChanged: (Gender value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                  RadioListTile<Gender>(
                    title: const Text('Female'),
                    value: Gender.Female,
                    groupValue: _selectedGender,
                    onChanged: (Gender value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _validateForm,
        tooltip: 'validate',
        child: Icon(Icons.done),
      ),
    );
  }
}
