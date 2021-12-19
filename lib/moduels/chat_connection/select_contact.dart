import 'package:flutter/material.dart';
import 'package:fam_tam/model/chat_model.dart';
import 'package:fam_tam/moduels/chat_connection/create_group.dart';

class SelectContact  extends StatelessWidget {

  List<ChatModel> contacts =[
    ChatModel(
      name: 'Boo',
     status: 'CS'
    ),
    ChatModel(
        name: 'resco',
        status: 'IT'
    ),
    ChatModel(
        name: 'sanpen',
        status: 'IS'
    ),
    ChatModel(
        name: 'gak',
        status: 'AI'
    ),
    ChatModel(
        name: 'Rondey',
        status: 'ML'
    ),
    ChatModel(
        name: 'frank',
        status: 'DB'
    ),
    ChatModel(
        name: 'treen',
        status: 'UI'
    ),
    ChatModel(
        name: 'Napel',
        status: 'HW'
    ),
    ChatModel(
        name: 'wedon',
        status: 'SW'
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact ",style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.bold),),
            Text("250 Contacts ",style: TextStyle(fontSize: 13.0,),),

          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: (){}),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context ){
                return[
                  PopupMenuItem(child: Text('invite a contact'),value:'invite a contact',),
                  PopupMenuItem(child: Text('Contacts'),value:'Contacts',),
                  PopupMenuItem(child: Text('Refresh'),value:'Refresh',),
                  PopupMenuItem(child: Text('Help'),value:'Help',),

                ];
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length +2 ,
        itemBuilder: (context,index){
          if (index == 0) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder)=> CreateGroup()));

              },
                child: BottomCard(icon: Icons.group,name: "New group",));
          }else if (index == 1){
            return BottomCard(icon: Icons.person,name: "New contact",);
          }
          return ContactCard(contacts[index -2 ]);
        }

      ),
    );
  }
}

class BottomCard extends StatelessWidget {
  final String name;
  final IconData icon ;
  BottomCard({this.icon,this.name});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CircleAvatar(
        radius: 23,
        child:Icon(icon),
      ),
      title:Text(name),

    );

  }
}

class ContactCard extends StatelessWidget {
  final ChatModel chatModel;
  ContactCard(this.chatModel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 53,
        height: 50,
        child: Stack(
          // alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo[200],
              radius: 23,
              child: Image.asset('assets/image/profile_default.png',color: Colors.white,width: 30,height: 30,),
            ),
            chatModel.select? Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 10.0,
                child: Icon(Icons.check,color: Colors.white,size: 20.0,) ,
              ),
            ): Container(),
          ],
        ),
      ),
      title:Text( chatModel.name),
      subtitle: Text(chatModel.status),
    );
  }
}


