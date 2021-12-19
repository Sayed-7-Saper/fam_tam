import 'package:fam_tam/model/notifcation_model/character_cubit.dart';
import 'package:fam_tam/model/notifcation_model/character_model.dart';
import 'package:fam_tam/model/notifcation_model/character_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class characterDetailes extends StatefulWidget {
  final Character character;

  const characterDetailes({Key key,@required this.character}) : super(key: key);
  @override
  _characterDetailesState createState() => _characterDetailesState(character);
}

class _characterDetailesState extends State<characterDetailes> {
  final Character character;

  _characterDetailesState(this.character);

  Widget buildSliverAppBar(){
    return SliverAppBar(
      expandedHeight: 600.0,
      backgroundColor: Colors.blueGrey,
      stretch: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title:Text('${character.nicKName}',
          style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold,color: Colors.white70),),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.image,fit: BoxFit.cover,),
        ),

      ),


    );
  }
  /////
  Widget characterInfo(String title , String value){
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text:TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color:Colors.white,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color:Colors.white70,
            ),

          ),
        ],
      ),
    );

  }
  /////
  Widget MyDivider(double endLenth){
    return Divider(
      color: Colors.blue,
      thickness: 2,
      height: 30,
      endIndent: endLenth,

    );
  }


  Widget showProgressIndicator(){
    return Center(
      child: CircularProgressIndicator(backgroundColor: Colors.amberAccent,),
    );

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // CharacterCubit.get(context).fatchData();
    BlocProvider.of<CharacterCubit>(context).fatchData();

  }


  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).fatchData();
    return BlocConsumer<CharacterCubit,CharactersState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.black45,
          body: CustomScrollView(
            slivers: [
              buildSliverAppBar(),
              SliverList(delegate:SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.fromLTRB(14,14,14,0),
                    padding: EdgeInsets.all(10.0),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // used join to print list of string
                        characterInfo('job : ',character.roleInSesson.join( ' / ')),
                        MyDivider(290),
                        characterInfo('Apperaned In  : ',character.categoryForTwoSeries),
                        MyDivider(220),
                        character.apperancOFBreakingSesson.isEmpty?Container():
                        characterInfo('Seasons : ',character.apperancOFBreakingSesson.join( ' / ')),
                        character.apperancOFBreakingSesson.isEmpty?Container():MyDivider(255),
                        characterInfo('Status : ',character.status),
                        MyDivider(270),
                        characterInfo('Actor : ',character.nameActor),
                        MyDivider(280),
                        character.apperancOFBetterCallSaulSesson.isEmpty ? Container():
                        characterInfo('Apperanc In Better Saul : ',character.apperancOFBetterCallSaulSesson.join( ' / ')),
                        character.apperancOFBetterCallSaulSesson.isEmpty ? Container(): MyDivider(165),
                        SizedBox(height: 25.0,),
                        BlocBuilder<CharacterCubit,CharactersState>(
                            builder:(context,state){
                              //return CheckQuoteIsLoaded(state);
                              return Container() ;
                            }
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 500.0,),
                ],
              ),
              ),

            ],

          ),
        );
      },

    );
  }
}