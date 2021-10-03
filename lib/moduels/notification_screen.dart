import 'package:fam_tam/model/notifcation_model/character_cubit.dart';
import 'package:fam_tam/model/notifcation_model/character_model.dart';
import 'package:fam_tam/model/notifcation_model/character_state.dart';
import 'package:fam_tam/moduels/charachter_detailesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fam_tam/layout/cubit/states.dart';
// import 'package:fam_tam/layout/cubit/cubit1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';


class NotificationScreen extends StatelessWidget {
  List<Character> allCharacter;
  List<Character> searchItemCharacter;
  Widget buildCharacterList(){
    return GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2/3,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
    ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount:  allCharacter.length,
        itemBuilder: (context,index){
          return CharacterItem(character: allCharacter[index],);
        });
    //textControll.text.isEmpty ? allCharacter.length : searchItemCharacter.length,
    // textControll.text.isEmpty ? allCharacter[index]:searchItemCharacter[index],
  }
  Widget buildNoConnectInternet(){
    return Center(
      child: Container(
        color: Colors.white,
        child:Column(
           // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20.0,),
              Text("I Can\'t Loading Check NetWork ",
                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.red),),
              SizedBox(height: 15.0,),
              Image.asset('image/loseNet.png'),
            ],
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body:  OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            )
        {
          final bool connected = connectivity != ConnectivityResult.none;
          if(connected){
            return BlocConsumer<CharacterCubit,CharactersState>(
              listener: (context,state){},
              builder: (context,state){
                if(state is CharacterLoaded){
                  allCharacter = (state).Characters;//.cast<Character>();
                  return SingleChildScrollView(
                    child: Container(
                      color:Colors.black45,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildCharacterList(),
                          ),

                        ],
                      ),
                    ),
                  );

                }
                else{
                  return Center(child: CircularProgressIndicator(backgroundColor:Colors.blueGrey,),);
                }
              },
            );

          }
          else{
            return buildNoConnectInternet();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),

      ),
    );
  }
}

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key key,@required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0,),
        color:Colors.white,
      ),
      child: InkWell(
        onTap:() {
          Navigator.push(context,MaterialPageRoute(builder: (context)=> characterDetailes(character: character,), ));
        },// =>  Navigator.pushNamed(context, '/charachter_detailesScreen',arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.charId,
            child: Container(
              color:Colors.black45,
              child: character.image.isNotEmpty?FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder:'image/loding.gif',
                image: character.image,
                fit: BoxFit.cover,): Image.asset('image/V1.png'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
            color: Colors.black45,
            alignment: Alignment.bottomCenter,
            child: Text('${character.name}',style: TextStyle(height: 1.5,fontSize: 16,fontWeight: FontWeight.bold,color:Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}