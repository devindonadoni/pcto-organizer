import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testfinale/pages/home_page_studente_start.dart';
import 'package:testfinale/widgets/custom_textfield.dart';
import '../beans/Studente.dart';
import '../beans/TutorScolastico.dart';
import '../business/data_handler.dart';
import '../business/handlers_wrapper.dart';
import '../constants.dart';
import '../pages/home_page_professore.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
  });

  @override
  State<FormWidget> createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool saveMyLogin = true;

  void handleLogin() async {
    Map<String, String> data_request = {
      'username': usernameController.text,
      'password': passwordController.text
    };

    dynamic loginResult = await loginHandler.login(data_request);

    if (loginResult == null) {
      return;
    }

    if (saveMyLogin) {
      saveLoginState(true);
    }

    if (loginResult is TutorScolastico) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage_Professore()),
      );
    } else if (loginResult is Studente) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePageStudenteStart()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            controller: usernameController,
            onChanged: (value) {},
            onSearch: () {},
            hintText: 'Username',
            icon: SvgPicture.asset(
              'assets/icons/User.svg',
              width: 20.0,
              height: 20.0,
            ),
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: passwordController,
            onChanged: (value) {},
            onSearch: () {},
            hintText: 'Password',
            icon: SvgPicture.asset(
              'assets/icons/Lock.svg',
              width: 20.0,
              height: 20.0,
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: handleLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: AccentColor,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
