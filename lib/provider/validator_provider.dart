import 'package:flutter/material.dart';

class ValidatorProvider extends ChangeNotifier{

  bool _isVisible=false;
  bool get isVisible=>_isVisible;
  //Strong password requirement
  RegExp strongPassword = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
  //Validated Email format
  RegExp emailRequirement = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  //General Validator
  validator(String value,String message){
    if(value.isEmpty){
      return message;
    }else{
      return null;
    }
  }

  //Mobilenumber Validator
  mobileValidator(String value){
    if(value.isEmpty){
      return "Mobilenumber is required !";
    }else if(value.length<10){
      return "Mobilenumber must contain 10 Digits";
    }else{
      return null;
    }
  }

  //Password Validator ! Strong Password
  passwordValidator(String value){
    if(value.isEmpty){
      return "Password is required !";
    }else if(!strongPassword.hasMatch(value)){
      return "Create a Strong Password";
    }else{
      return null;
    }
  }
  //Confirm Password
  confirmValidator(String confirmValue,String passValue){
    if(confirmValue.isEmpty){
      return "Confirm Password is required !";
    }else if(confirmValue!=passValue){
      return "Password doesn't match";
    }else{
      return null;
    }
  }

  //Email Validator
  emailValidator(String value){
    if(value.isEmpty){
      return "Email ID is required";
    }else if(!emailRequirement.hasMatch(value)){
      return "Email is not valid";
    }else{
      return null;
    }
  }

  //Password show & Hide
  void showPassword(){
    _isVisible=!_isVisible;
    notifyListeners();
  }
}