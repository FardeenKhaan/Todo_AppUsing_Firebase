import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_usingfirebase/data/firestor.dart';

class Add_Notes extends StatefulWidget {
  const Add_Notes({super.key});

  @override
  State<Add_Notes> createState() => _Add_NotesState();
}

class _Add_NotesState extends State<Add_Notes> {
  final _titlecontroller = TextEditingController();
  final _subtitlecontroller = TextEditingController();

  FocusNode _focusnode1 = FocusNode();
  FocusNode _focusnode2 = FocusNode();

  int indexx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _titlecontroller,
                focusNode: _focusnode1,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    hintText: 'title',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xffc5c5c5),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                maxLines: 3,
                controller: _subtitlecontroller,
                focusNode: _focusnode2,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    hintText: 'subtitle',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xffc5c5c5),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 180,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        indexx = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2,
                              color: indexx == index
                                  ? Colors.green
                                  : Colors.grey)),
                      width: 140,
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        children: [Image.asset('assets/${index}.png')],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[400],
                      minimumSize: Size(170, 50)),
                  onPressed: () {
                    Firestore_Datasource().AddNote(_subtitlecontroller.text,
                        _titlecontroller.text, indexx);
                    Navigator.pop(context);
                  },
                  child: Text('Add Task')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, minimumSize: Size(170, 50)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'))
            ],
          )
        ],
      ),
    );
  }
}