import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../beans/User.dart';
import '../pages/login2_page.dart';

int loginType = 0; // 0 sta per alunno 1 sta per professore 2 sta per
bool logged = false;
bool menu_enabled = false;
int filtroAttive = 0;
int filtroEta = 0; // 0 -> No filtro, 1 -> Maggiorenne 2 -> Minorenne
bool profileComlpeted=false;


var usernameController = TextEditingController();
var passwordController = TextEditingController();
var searchController = TextEditingController();
var homePageViewIndex = 0;


List<User> utenti = [];

void setLoginState(int tipoUtente){
  switch(tipoUtente){
    case 0:
      loginType=0;
      break;
    case 1:
      loginType=1;
      break;
    case 2:
      loginType=2;
      break;
    case 3:
      loginType=3;
      break;
  }
}

void checkLoginState(BuildContext context){
  if(logged=false){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login2Page()),
    );
  }
}
