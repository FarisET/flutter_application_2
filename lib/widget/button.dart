import 'package:flutter/material.dart';

class FlutterButtons extends StatelessWidget {
  const FlutterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                      onPressed: () {
              //          print('elevated');
                      },
                  child: Text('Press Me'))),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: FilledButton(
                    onPressed: () {
                      print('filled button');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Filled'),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    child: FilledButton.icon(
                        onPressed: () {
                          print('Tonal 1');
                        },
                        icon: Text('Tonal 2'),
                        label: Icon(Icons.person_2)),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    child: FilledButton.icon(
                        onPressed: () {
                          print('Tonal 2');
                        },
                        icon: Icon(Icons.person_2),
                        label: Text('Tonal 2')),
                  ),
                ],
              ),
                GestureDetector(
                  onDoubleTap: () {
                    print('Clicked');
                  },
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  )
                  ),
                ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: TextButton(
                  onPressed: () {
                    print('Text Button');
                  },
                  child: Text('Text'),
                ),
              )
            ],
          ),
        ));
  }
}
