import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderAnimationPage extends StatefulWidget {
  const SliderAnimationPage({Key? key}) : super(key: key);

  @override
  _SliderAnimationPageState createState() => _SliderAnimationPageState();
}

class _SliderAnimationPageState extends State<SliderAnimationPage> {
  final List<String> _item = List.generate(8, (index) => "Stack $index");
  ScrollController controller = ScrollController();
  PageController pageController = PageController(viewportFraction: 0.3);
  int currentindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        currentindex = controller.offset ~/ 120;
        pageController.animateToPage(currentindex, duration: Duration
          (milliseconds: 100), curve:
        Curves.fastOutSlowIn);

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  alignment: Alignment.center,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemExtent: 120,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.02),
                                      blurRadius: 12,
                                      spreadRadius: 2,
                                      offset: Offset(1, 5))
                                ]),
                            child: Text(_item[index]),
                          ),
                        );
                      },
                      itemCount: _item.length,
                      controller: controller),
                ),
                indicator()
              ],
            )),
      ),
    );
  }

  Widget indicator() {
    return Container(
      height: 20,
      width: 60,
      child: Center(
        child: PageView.builder(
          controller: pageController,
            allowImplicitScrolling: true,
            itemCount: _item.length,
            pageSnapping: true,
            padEnds: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Center(
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          index == currentindex ? Colors.black : Colors.grey),
                ),
              );
            }),
      ),
    );
  }
}
