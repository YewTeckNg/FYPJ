import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:postgres/postgres.dart';
import 'package:project/pages/account/login.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // use this controller to get what the user typed
  bool _secureText1 = true;

  final bool _secureText2 = true;

  bool? isCheck = false;

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController mobilenumberController = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  RegExp dateRegExp = RegExp(r'^(0[1-9]|[12][0-9]|3[01])[- /.]');

  late DateTime birthDate;

  String? UID;

  String? _genderchoice;

  Future<void> connectAndPerformOperations() async {
    final connection = PostgreSQLConnection(
      '20.198.133.115',
      80,
      'postgres',
      username: 'admin',
      password: 'admin',
    );

    try {
      // RNG
      int random1(int min, int max) {
        return min + Random().nextInt(max - min);
      }

      int random2(int min, int max) {
        return min + Random().nextInt(max - min);
      }

      UID =
          "${random1(10000000000, 12000000000)}${random1(1000000000, 4999999998)}";

      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      int month1 = currentDate.month;
      int month2 = birthDate.month;
      if (month2 > month1) {
        age--;
      } else if (month1 == month2) {
        int day1 = currentDate.day;
        int day2 = birthDate.day;
        if (day2 > day1) {
          age--;
        }
      }

      String NameForDB = nameController.text;
      String EmailForDB = emailController.text;
      String MobileNumberForDB = mobilenumberController.text;
      String formattedDate = DateFormat("dd/MM/yyyy").format(birthDate);

      debugPrint("UID: $UID");
      debugPrint("Name: $NameForDB");
      debugPrint("Age: $age");
      debugPrint("Gender: $_genderchoice");
      debugPrint("Email: $EmailForDB");
      debugPrint("Mobile Number: $MobileNumberForDB");
      debugPrint("Birth Date: $formattedDate");
      debugPrint("next attempt");
      await connection.open();

    //   // Create a row
    //   final insertResult = await connection.execute('''
    //   INSERT INTO public.userprofile ("User ID", "Name", "age", "gender", "race", "password", "email", "birthdate", "mobilenumber")
    //   VALUES ('$UID', '$NameForDB', '$age', '$_genderchoice', '5','6', '$EmailForDB', '$formattedDate', '$MobileNumberForDB');
    // ''');
    //   print('Row inserted successfully!');
    // Read a row
      final selectResult = await connection
          .query('SELECT * FROM public.userprofile WHERE "email" = "$EmailForDB"');
      for (final row in selectResult) {
        print('Read row: $row');
      }
      print("row");
    } catch (e) {
      print('Error: $e');
    } finally {
      await connection.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 97),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 220),
                  child: Text(
                    'Full Name',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, left: 50),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      hintText: ' Johnny',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 15,
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Name is required';
                      }
                      if (value.length < 6) {
                        return 'Name must have at least 6 characters';
                      }
                      return null;
                    },
                    // maxLength: 15,
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 245),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, left: 50),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      hintText: ' Johnny@gmail.com',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 15,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!EmailValidator.validate(value, true)) {
                        return 'Invalid Email Address';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 218),
                  child: Text(
                    'Birth Date',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, left: 50),
                  child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      hintText: ' Birth Date',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 15,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat("dd/MM/yyyy").format(pickedDate);
                            setState(
                              () {
                                dateController.text = formattedDate.toString();
                                birthDate = pickedDate;
                              },
                            );
                          } else {
                            debugPrint("No date selected");
                          }
                        },
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Birth Date is required';
                      }
                      // if(!dateRegExp.hasMatch(value)){
                      //   return 'Invalid Date';
                      // }
                      return null;
                    },
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 240),
                  child: Text(
                    'Gender',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Radio(
                              value: "Male",
                              groupValue: _genderchoice,
                              onChanged: (val1) {
                                setState(() {
                                  _genderchoice = val1;
                                });
                              },
                            ),
                          ),
                          const Text(
                            "Male",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Radio(
                              value: "Female",
                              groupValue: _genderchoice,
                              onChanged: (val2) {
                                setState(() {
                                  _genderchoice = val2;
                                });
                              },
                            ),
                          ),
                          const Text(
                            "Female",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 182),
                  child: Text(
                    'Mobile Number',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, left: 50),
                  child: TextFormField(
                    controller: mobilenumberController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      hintText: ' Mobile Number',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 15,
                      ),
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(8),
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    ],
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Mobile Number is required';
                      }
                      if (value.length != 8) {
                        return 'Invalid Mobile Number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 220),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, left: 50),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      hintText: ' Password',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 15,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _secureText1 = !_secureText1;
                          });
                        },
                        child: Icon(
                          _secureText1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    obscureText: _secureText1,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Password is required';
                      }
                      if (!passwordRegex.hasMatch(value)) {
                        return 'Please enter a stronger password';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 163),
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, left: 50),
                  child: TextFormField(
                    controller: confirmPassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      hintText: ' Confirm Password',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 15,
                      ),
                    ),
                    obscureText: _secureText2,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Confirm Password is required';
                      }
                      if (password.text != confirmPassword.text) {
                        return 'The 2 passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CheckboxListTile(
                      activeColor: Colors.red.shade800,
                      // set the checkbox to the left
                      controlAffinity: ListTileControlAffinity.leading,
                      title: RichText(
                          text: TextSpan(children: <TextSpan>[
                        const TextSpan(
                          text: 'Agree to the ',
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text: 'Terms of service ',
                          style: TextStyle(
                            color: Colors.red.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: 'and ',
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Colors.red.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                      value: isCheck,
                      onChanged: (bool? newBool) {
                        setState(() {
                          isCheck = newBool;
                          debugPrint('$newBool');
                        });
                      }),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (isCheck == false) {
                        showTopSnackBar1(context);
                        // debugPrint("${nameController.text}hi");
                        // password.clear();
                        // confirmPassword.clear();
                      } else {
                        DateTime currentDate = DateTime.now();
                        int age = currentDate.year - birthDate.year;
                        int month1 = currentDate.month;
                        int month2 = birthDate.month;
                        if (month2 > month1) {
                          age--;
                        } else if (month1 == month2) {
                          int day1 = currentDate.day;
                          int day2 = birthDate.day;
                          if (day2 > day1) {
                            age--;
                          }
                        }
                        if (_genderchoice != "Male" &&
                            _genderchoice != "Female") {
                          showTopSnackBar2(context);
                        } else {

                          connectAndPerformOperations();
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) {
                          //       return const IntroPages();
                          //     },
                          //   ),
                          // );
                        }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade600,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(300, 60),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ))),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // use text span to have multiple types of colors in a statement
                // or statement with different fonts sizes etc.
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Log in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade600,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const LoginPage();
                                },
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showTopSnackBar1(BuildContext context) => Flushbar(
        icon: const Icon(
          Icons.error,
          size: 32,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        padding: const EdgeInsets.all(24),
        title: 'Error message',
        message: 'Please agree to the Terms of service and Privacy Policy.',
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 2),
        barBlur: 20,
        backgroundColor: Colors.red.shade700.withOpacity(0.9),
      )..show(context);

  void showTopSnackBar2(BuildContext context) => Flushbar(
        icon: const Icon(
          Icons.error,
          size: 32,
          color: Colors.white,
        ),
        shouldIconPulse: false,
        padding: const EdgeInsets.all(24),
        title: 'Error message',
        message: 'Please select a gender',
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 2),
        barBlur: 20,
        backgroundColor: Colors.red.shade700.withOpacity(0.9),
      )..show(context);
}
