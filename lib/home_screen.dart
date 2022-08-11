import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practical Task'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        SizedBox(width: 15,),
                        Text('Album Title 1'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => Container(
                        color: Colors.grey,
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text('Card $index'),
                        ),
                      ),
                    ),
                  ),

                  // Row(
                  //   children: [
                  //     SizedBox(width: 15,),
                  //     Text('Album Title 1'),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 150,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: 10,
                  //     itemBuilder: (context, index) => Container(
                  //       color: Colors.grey,
                  //       height: 150,
                  //       width: 150,
                  //       margin: EdgeInsets.all(10),
                  //       child: Center(
                  //         child: Text('Card $index'),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              );
            },

          ),
        ),
      ),
    );
  }
}
