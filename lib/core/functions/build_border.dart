import 'package:flutter/material.dart';

builBorder({required Color color}){
  return OutlineInputBorder(
    borderSide: BorderSide(color:color),
    borderRadius: BorderRadius.circular(15),
  );
}