import 'package:flutter/material.dart';
class ChildImage{
  final String image;
  final String name;
  ChildImage({@required this.image,@required this.name});
}
List<ChildImage>children=[
  ChildImage(image: 'assets/image/5.jpg', name: 'null'),
  ChildImage(image: 'assets/image/7.jpg', name: 'nellman'),
  ChildImage(image: 'assets/image/9.jpg', name: 'farme'),
  ChildImage(image: 'assets/image/10.jpg', name: 'weterd'),
  ChildImage(image: 'assets/image/11.jpg', name: 'jon'),
  ChildImage(image: 'assets/image/12.jpg', name: 'press'),
  ChildImage(image: 'assets/image/13.jpg', name: 'trapm'),
  ChildImage(image: 'assets/image/5.jpg', name: 'wevan'),
  ChildImage(image: 'assets/image/9.jpg', name: 'maclarn'),
  ChildImage(image: 'assets/image/11.jpg', name: 'gona'),
  ChildImage(image: 'assets/image/13.jpg', name: 'qdras'),
  ChildImage(image: 'assets/image/7.jpg', name: 'nellman'),


];

class ChildrenPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15.0,),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: children.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Image(
                                image: AssetImage(children[index].image),
                                height: 100.0,
                                width: 150.0,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: Colors.black.withOpacity(
                                  .8,
                                ),
                                width: 100.0,
                                child: Text(
                                  children[index].name,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,fontSize: 13.0,fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
