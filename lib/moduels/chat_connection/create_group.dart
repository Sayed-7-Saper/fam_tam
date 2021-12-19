 import 'package:flutter/material.dart';
import 'package:fam_tam/model/chat_model.dart';

class CreateGroup  extends StatefulWidget {

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
    ChatModel(
        name: 'fodon',
        status: 'SW'
    ),
    ChatModel(
        name: 'gapen',
        status: 'SW'
    ),
    ChatModel(
        name: 'marken',
        status: 'SW'
    ),

  ];

  List <ChatModel> groups =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New group  ",style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.bold),),
            Text("Add participants ",style: TextStyle(fontSize: 13.0,),),

          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: (){}),

        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context,index){
                if(index == 0){
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }

                return InkWell(
                    onTap: (){
                      if(contacts[index - 1].select == true){
                        setState(() {
                          groups.remove(contacts[index - 1]);
                          contacts[index -1 ].select = false ;
                        });
                      }
                      else{
                        setState(() {

                          groups.add(contacts[index -1]);
                          contacts[index -1].select = true ;

                        });
                      }

                    },
                    child: ContactCard(contacts[index -1]));
              }

          ),
         groups.length >= 1 ? Column(
            children: [
              Container(
                height: 85.0,
                color: Colors.white,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) {
                   if (contacts[index].select == true) {
                     return InkWell(
                        onTap: () {
                          setState(() {
                            groups.remove(contacts[index ]);
                            contacts[index].select = false;
                          });
                        },
                        child: AvtarCard(contact: contacts[index ],)
                    );
                    }
                   else {
                     return Container();
                      }
                      },

                    separatorBuilder: (context, index){
                      return SizedBox(width: 10.0,);
                    },
                    itemCount: contacts.length ,
                ),
              ),
              Divider(thickness: 1.0,),
            ],
          )
             : Container(),
        ],
      ),
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
 class AvtarCard extends StatelessWidget {
   final ChatModel contact;
   AvtarCard({this.contact});
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Stack(
             // alignment: AlignmentDirectional.bottomEnd,
             children: [
               CircleAvatar(
                 backgroundColor: Colors.indigo[200],
                 radius: 23,
                 child: Image.asset('assets/image/profile_default.png',color: Colors.white,width: 30,height: 30,),
               ),
               Positioned(
                 bottom: 0,
                 right: 0,
                 child: CircleAvatar(
                   backgroundColor: Colors.grey,
                   radius: 10.0,
                   child: Icon(Icons.close,color: Colors.white,size: 20.0,) ,
                 ),
               ),
             ],
           ),
           SizedBox(height: 5.0,),
           Text(contact.name),

         ],
       ),
     );
   }
 }

