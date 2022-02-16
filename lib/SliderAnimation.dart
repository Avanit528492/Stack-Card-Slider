import 'package:flutter/material.dart';


class SliderAnimationPage extends StatefulWidget {
  const SliderAnimationPage({Key? key}) : super(key: key);

  @override
  _SliderAnimationPageState createState() => _SliderAnimationPageState();
}

class _SliderAnimationPageState extends State<SliderAnimationPage> with SingleTickerProviderStateMixin {

 final List<String> _item = List.generate(10, (index) => "Stack $index");
 AnimationController? _controller;
 Animation<Offset>? _animationOffset;

 Offset offset = Offset(0, 0);


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration
      (milliseconds: 200));
    _animationOffset = Tween<Offset>(begin: Offset(0,0),end: Offset(-1000,0))
        .animate(_controller!);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Stack(
            children: _item.reversed.map((item){

              int index = _item.indexWhere((element) => item == element);
              setState(() {
                offset = Offset(20+index.toDouble()*3, 0);
              });
                return GestureDetector(
                  onPanUpdate: (details){
                    print(details.delta.dx);
                    setState(() {
                      offset = Offset(details.delta.dx, 0);
                    });

                  },
                  child: _wdSlider(index),
                );
            }).toList(),
          ),
        ),
      ),
    );
  }

 Widget _wdSlider(int index){
    String value = _item[index];
    return Transform.translate(
      offset: offset,
      child: Transform.scale(
        scale: 1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width - 60,
            height: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.black,width: 0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: Offset(1,5)
                )
              ]
            ),
            child: Text(value,style: TextStyle(fontSize: 20),),
          ),
        ),
      ),
    );
  }

}
