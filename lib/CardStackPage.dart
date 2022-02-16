import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardStackPage extends StatefulWidget {
  const CardStackPage({Key? key}) : super(key: key);

  @override
  _CardStackPageState createState() => _CardStackPageState();
}

class _CardStackPageState extends State<CardStackPage> {
  final List<String> _item = List.generate(10, (index) => "Stack $index");
  PageController controller = PageController();
  var _width;
  var currentPage = 0.0;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });

    print(currentPage);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 350,
            child: Center(child: Column(
              children: [
                Expanded(child: cardList()),
                indicator(),
              ],
            )),
          ),
        ),
      ),
    );
  }

  Widget cardList() {
    return Stack(
      children: [
        cardStack(),
        PageView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            return Container();
          },
          itemCount: _item.length,
        )
      ],
    );
  }

  Widget cardStack() {
    List<Widget> _list = [];

    return Stack(
      children: _item.reversed.map((e) {
        int index = _item.indexWhere((element) => element == e);
        // var topOffset = -((15 * index) - (currentPage * 15));

        double rightOffset;
        if(_item.length-1 != currentPage.round()){
          if(index == currentPage.round()){
            rightOffset = 30.0;
          }
          else{
            rightOffset =-30;
          }
        }
        else{
          rightOffset =0;
        }
        return Positioned(
          child: Transform.scale(scale: index == currentPage.round() ? 1: 0.93,child: cardView(index)),
          top: 0,
          left: currentPage > index ? -(currentPage - index) * (_width * 4) : 0,
          right: rightOffset,
        );
      }).toList(),
    );
  }

  Widget cardView(int index) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 0.5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: Offset(1, 5))
            ]),
        child: Text(
          _item[index],
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget indicator(){
    return SmoothPageIndicator(controller: controller, count: _item.length,
      effect: ScrollingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,

      ),);
  }
}
