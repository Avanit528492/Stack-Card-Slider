import 'package:flutter/material.dart';


class TextBoxDesign extends StatefulWidget {
  const TextBoxDesign({Key? key}) : super(key: key);

  @override
  _TextBoxDesignState createState() => _TextBoxDesignState();
}

class _TextBoxDesignState extends State<TextBoxDesign> {
  List<Modal> list = <Modal>[];
  int selectedIndex = -1;

  @override
  void initState(){
    super.initState();
    _createList();
  }

  _createList() {
    list.add(Modal(title: "What is Lorem Ipsum?", desc: "Lorem Ipsum is simply"
        " dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."));
    list.add(Modal(title: "What is Lorem Ipsum?", desc: "Lorem Ipsum is simply"
        " dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (_,index){
              return wd_listview(index);
            },
            itemCount: list.length,
          ),
        ),
      ),
    );
  }

  Widget wd_listview(int index){
    Modal obj = list[index];
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     height: index == selectedIndex ? null : 120,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(obj.title!),
    //         SizedBox(height: 10,),
    //        Stack(
    //          children: [
    //            Text(obj.desc!)
    //          ],
    //        )
    //       ],
    //     ),
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(obj.title!),
                    SizedBox(height: 10,),
                    Text(obj.desc!,maxLines: index == selectedIndex ? null : 5,)
                  ],
                )
            ),
          ),
          if(index != selectedIndex) Positioned(bottom:0,child: Container(
            height: 20,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white24,
                  Colors.white
                ],
                stops: [0.0, 1.0],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              )
            ),
            width: MediaQuery.of(context).size.width,
          ))
        ],
      )
    );
    
  }

}

class Modal {
  String? title;
  String? desc;

  Modal({this.title, this.desc});
}