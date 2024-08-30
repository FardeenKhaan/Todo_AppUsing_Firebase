import 'package:flutter/material.dart';
import 'package:todo_app_usingfirebase/data/firestor.dart';
import 'package:todo_app_usingfirebase/model/notes_model.dart';
import 'package:todo_app_usingfirebase/screen/edit_screen.dart';

class Tasks_Widgets extends StatefulWidget {
  Note _note;
  Tasks_Widgets(this._note, {super.key});

  @override
  State<Tasks_Widgets> createState() => _Tasks_WidgetsState();
}

class _Tasks_WidgetsState extends State<Tasks_Widgets> {
  @override
  Widget build(BuildContext context) {
    bool isdone = widget._note.isDon;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [
              Container(
                height: 130,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/${widget._note.image}.png'),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget._note.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Checkbox(
                              value: isdone,
                              onChanged: (value) {
                                setState(() {
                                  isdone = !isdone;
                                });
                                Firestore_Datasource()
                                    .isdone(widget._note.id, isdone);
                              })
                        ],
                      ),
                      Text(widget._note.subtitle),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: 28,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icon_time.png',
                                      height: 15, width: 15),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'time',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Edit_Screen(widget._note)));
                              },
                              child: Container(
                                width: 90,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 30, 30, 30),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icon_edit.png',
                                    ),
                                    // Image(
                                    //     image: AssetImage(
                                    //   'assets/icon_time.png',
                                    // )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'edit',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ])),
      ),
    );
  }
}
