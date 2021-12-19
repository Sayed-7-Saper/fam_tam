import 'package:flutter/cupertino.dart';

class ChatModel{
  int id ;
  String name ;
  IconData icon ;
  String currentMessage;
  String time;
  bool isGroup;
  String image;
  String status;
  bool select  ;
  ChatModel({
    this.id,this.name,
    this.icon,this.currentMessage,
    this.time,this.isGroup,
    this.image,this.status,
    this.select=false,
  });
}