/*

import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:chat_cats/layout/camera_screen_layout.dart';
import 'package:chat_cats/modules/customUI/own_file_card.dart';
import 'package:chat_cats/model/message_model.dart';
import 'package:chat_cats/modules/camera_icon/camer_view_page.dart';
import 'package:chat_cats/modules/customUI/replay_file_card.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_cats/model/chat_model.dart';
import 'package:chat_cats/modules/customUI/ownMessage_card.dart';
import 'package:chat_cats/modules/customUI/replayMessage_card.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO ;
import 'dart:async';
import 'package:http/http.dart' as http;

class IndivdualPage extends StatefulWidget {
  final ChatModel chatModel;
  final ChatModel sourchat;
  IndivdualPage({this.chatModel,this.sourchat});
  @override
  _IndivdualPageState createState() => _IndivdualPageState();
}

class _IndivdualPageState extends State<IndivdualPage> {
  TextEditingController textController =TextEditingController();
  ScrollController scrollController = ScrollController();
  bool show =false;
  FocusNode focusNode = FocusNode();
  IO.Socket socket ;
  bool sentButton = false;
  List<MessageModel> messages =[];
  ImagePicker _picker= ImagePicker() ;
  XFile file;
  File img;
  int popTime =0 ;
  //////////////////////
  Future<void>opengalery()async{
   // file = (await ImagePicker.pickImage(source: ImageSource.gallery)) as XFile;
   img = await ImagePicker.pickImage(source: ImageSource.gallery);
    Navigator.push(context, MaterialPageRoute(builder:
        (builder)=> CameraViewPage
          (path: img.path,func:onImageSend ,)));
    setState(() {
      popTime = 2;
    });
  }


  ////////////////////////////////////////////////////////
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     connect();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        setState(() {
          show = false;
        });
      }
    });
  }
  void connect(){
    socket= IO.io("http://192.168.1.14:5000/",<String,dynamic>{
      "transports":["websocket"],
      "autoConnect":false,
    });
    socket.connect();
    socket.emit("signin",widget.sourchat.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"],msg["path"]);
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      });
    });
    print(socket.connected);

  }

  void sendMessage(String message ,int sourceId ,int targetId,String path){
    setMessage("source",message,path);
    socket.emit("message",
        {
          "message":message , "sourceId":sourceId ,"targetId":targetId ,"path":path
        }
    );
  }

  void setMessage(String type, String msg,String path){
    MessageModel messageModel = MessageModel(type: type,
        message: msg,time: DateTime.now().toString().substring(10,16),
      path: path,
    ); //(10 ,16)
    setState(() {
      messages.add(messageModel);
      path = null ;
    });
  }
  //////////////////////////
   void onImageSend(String path,{String message})async{
    print(" Hi Image $message ");
    for(int i =0; i< popTime; i++){
      Navigator.pop(context);
    }
    setState(() {
      popTime = 0;
    });
    var request =http.MultipartRequest(
      "POST", Uri.parse("http://192.168.1.14:5000/routes/addimage"),);
    request.files.add(await http.MultipartFile.
    fromPath("img", path));
    request.headers.addAll({
      "Content-Type": "multipart/form-data",
    });
    http.StreamedResponse response = await request.send();
    var httpResponse = await http.Response.fromStream(response);
    var data = json.decode(httpResponse.body);
    print(data['path']);
    print(response.statusCode);
    setMessage("source",message,path);
    socket.emit("message",
        {
        "message":message ,
          "sourceId":widget.sourchat.id ,
          "targetId":widget.chatModel.id ,
          "path":data['path'],
        }
    );


   }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/whatsApp.png',
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        titleSpacing: 0.0,
        leadingWidth: 80,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back,size: 25,),
              CircleAvatar(
                radius: 23.0,
                // backgroundImage: AssetImage('assets/images/SS.jpg'),
                child:SvgPicture.asset(widget.chatModel.isGroup?'assets/images/groups.svg':'assets/images/person.svg') ,
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: (){},
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatModel.name,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                Text('last seen today at 12:05 pm ',style: TextStyle(fontSize: 13.0,)),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(icon:Icon (Icons.video_call_rounded), onPressed: (){}),
          IconButton(icon:Icon (Icons.call), onPressed: (){}),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context ){
                return[
                  PopupMenuItem(child: Text('label chat'),value:'label chat',),
                  PopupMenuItem(child: Text('view contact'),value:'view contact',),
                  PopupMenuItem(child: Text('Media,links,and docs'),value:'Media,links,and docs ',),
                  PopupMenuItem(child: Text('Search'),value:'Search',),
                  PopupMenuItem(child: Text('mute notification'),value:'mute notification',),
                  PopupMenuItem(child: Text('More'),value:'More ',),

                ];
              }),

        ],

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Column(
            children: [
              Expanded(
               // height: MediaQuery.of(context).size.height - 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  itemCount: messages.length + 1,
                  itemBuilder: (context,index){
                    if(index == messages.length ){
                      return Container(height: 70,);
                    }
                    if(messages[index].type == "source"){
                      if(messages[index].path.length > 0){
                        return OwnFileCard(
                          path:messages[index].path ,
                          message:messages[index].message,
                          time: messages[index].time,

                        );
                      }else{
                        return OwnMessageCard(
                          message:messages[index].message,
                          time:messages[index].time,
                        );
                      }

                    }else{
                      if(messages[index].path.length > 0){
                        return ReplayFileCard(
                          path:messages[index].path ,
                          message:messages[index].message,
                          time: messages[index].time,
                        );
                      }
                      else{
                        return ReplayMessageCard(
                          message:messages[index].message,
                          time:messages[index].time,
                        );
                      }
                    }

                  },

                ),


              ),

              Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    height: 70,
                    child: Column(
                      //
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 60 ,
                              margin: EdgeInsets.only(left: 3.0,right: 3.0,bottom: 8.0),
                              // padding: EdgeInsets.all(5.0),

                              child: Card(
                                shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                                child: TextFormField(
                                  controller: textController,
                                  focusNode: focusNode,
                                  keyboardType: TextInputType.multiline,
                                  textAlignVertical: TextAlignVertical.center,
                                  onChanged: (value){
                                    if (value.length > 0){
                                      setState(() {
                                        sentButton = true;
                                      });
                                    }
                                    else{
                                      setState(() {
                                        sentButton = false;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Type a message ',
                                    prefixIcon: IconButton(icon: Icon(Icons.emoji_emotions),onPressed: (){
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false ;
                                      setState(() {
                                        show = !show;
                                      });
                                    },),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(icon: Icon(Icons.attach_file_rounded),onPressed: (){
                                          showModalBottomSheet(
                                              backgroundColor:
                                              Colors.transparent,
                                              context: context,
                                              builder: (builder) =>
                                                  bottomSheet());
                                        },),
                                        IconButton(icon: Icon(Icons.camera_alt),
                                          onPressed: (){
                                            setState(() {
                                              popTime = 2;
                                            });
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (builder)=>
                                                        CameraScreen(func:onImageSend ,),
                                                ),
                                            );
                                        },),
                                      ],
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom:8.0),
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Color(0xff128C7E),
                                child:  IconButton(icon: Icon(sentButton?Icons.send :Icons.mic,color: Colors.white,),
                                  onPressed: (){

                                  if(sentButton){
                                    scrollController.animateTo(
                                        scrollController.position.maxScrollExtent,
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeOut,
                                    );
                                    sendMessage(textController.text,
                                        widget.sourchat.id,widget.chatModel.id,"",

                                    );
                                    textController.clear();
                                    setState(() {
                                      sentButton = false;
                                    });
                                  }
                                  },),
                              ),
                            ),
                          ],
                        ),
                        ////
                        show ? emojiSelect():Container(),
                      ],
                    ),
                  )
              ),
            ],
          ),
          onWillPop: (){
            if(show){
              setState(() {
                show = false ;
              });
            } else{
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),

    ),
      ],
    );
  }


  ///////////////////////////////////

  Widget bottomSheet(){
    return Container(
      height: 250.0,
      width: MediaQuery.of(context).size.width,

      child: Card(
        margin: EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: iconCreation(
                      Icons.insert_drive_file,
                      "Decument", Colors.blueAccent,
                        (){},
                  )),
                  Expanded(child:
                  iconCreation(
                      Icons.camera_alt,
                      "Camera", Colors.pink,
                        (){
                          setState(() {
                            popTime = 3;
                          });
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=> CameraScreen(func:onImageSend ,)));
                        },
                  ),),
                  Expanded(child:
                  iconCreation(
                      Icons.photo,
                      "Gallery",
                      Colors.deepPurple,
                    opengalery,
                  ),),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child:
                  iconCreation(
                      Icons.headset,
                    "Audio", Colors.orange,
                        (){},
                  )),
                  Expanded(child:
                  iconCreation(
                      Icons.location_on_sharp,
                      "Location", Colors.green,
                        (){},
                  ),),
                  Expanded(child:
                  iconCreation(
                      Icons.person,
                      "Contact",
                      Colors.indigo,
                        (){},),),

                ],
              ),


            ],
          ),
        ),

      ),
    );
  }
  Widget iconCreation(IconData icon , String text , Color color,Function ontap){
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: color,
            child: Icon(icon,size: 25,color: Colors.white,),
          ),
          SizedBox(height: 5.0,),
          Text(text),
        ],
      ),
    );


  }
  Widget emojiSelect(){
    return EmojiPicker(
      rows: 5,
        columns: 7,
        onEmojiSelected: (emoji, category){
          print(emoji);
          setState(() {
            textController.text = textController.text + emoji.emoji ;
          });
        }
        );
  }


}
*/
