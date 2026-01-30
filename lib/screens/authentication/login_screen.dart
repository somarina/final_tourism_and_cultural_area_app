import 'package:final_tourism_and_cultural_area_app/routes/app_colors/app_colors.dart' show AppColor;
import 'package:final_tourism_and_cultural_area_app/routes/app_fonts/app_fonts.dart' show AppFonts;
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isEmail = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset("assets/images/login_screen/login_image01.png"),
              SizedBox(height: 15),
              Text("ចូលគណនី", style: AppFonts.fontsTitle),
              SizedBox(height: 15),
              // switch button
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[350],
                ),
                child: Row(
                  children: [
                    buildSwitchbtn(
                      text: "លេខទូរស័ព្ទ",
                      selected: !isEmail,
                      ontap: () {
                        setState(() {
                          isEmail = false;
                        });
                      },
                    ),
                    buildSwitchbtn(
                      text: "អ៊ីម៉ែល",
                      selected: isEmail,
                      ontap: () {
                        setState(() {
                          isEmail = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              // switch Email or phone for input
              buildEmailOrPhone(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailOrPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(isEmail ? "អ៊ីម៉ែល" : "លេខទូរស័ព្ទ", style: AppFonts.fontsGeneral),
        isEmail ? buildEmail() : buildPhone(),
        SizedBox(height: 15),
        Text(" ពាក្យសម្ងាត់", style: AppFonts.fontsGeneral),
        buildPassword(),
        SizedBox(height: 15),
        buildElevatedButton(),
        SizedBox(height: 15),
        Container(width: double.infinity, color: Colors.grey, height: 1),
        SizedBox(height: 15),
        buildRegister(),
      ],
    );
  }

  Widget buildRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("មិនមានគណនីមែនទេ?", style: AppFonts.fontsRegister),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            // print test sin te 
            print("object");
          },
          child: Text(
            "ចុះឈ្មោះ",
            style: AppFonts.fontsGeneral.copyWith(color: AppColor.primaryColor),
          ),
        ),
      ],
    );
  }

  Widget buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        // testing validate
        print("object");
        // code 
        // formKey.currentState!.validate();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF00842A),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text("ចូលគណនី", style: AppFonts.fontsButton),
    );
  }

  Widget buildPhone() {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildEmail() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter some text";
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return "Please enter a valid email address";
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildPassword() {
    return TextFormField(
      maxLength: 8,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter password";
        } else if (value.length < 8) {
          return "Password must be at least 8 charaters";
        } else if (!RegExp(
          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-])(.{8,})$',
        ).hasMatch(value)) {
          return "Password Invalid";
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildSwitchbtn({
    required String text,
    required bool selected,
    required ontap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(text, style: AppFonts.fontsGeneral)),
        ),
      ),
    );
  }
}
