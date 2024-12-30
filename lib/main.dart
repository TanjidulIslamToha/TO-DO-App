import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        foregroundColor: Colors.white70,
        elevation: 2,
        shadowColor: Colors.black45,
        backgroundColor: Color(0xff3c3c3c),
      ),
      body: Design(),
      // floatingActionButton: CircleAvatar(backgroundColor: Color(0xff454545),
      // radius: 25,
      // child: Icon(Icons.add_box,color: Colors.white,),),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff454545),
        elevation: 5,
        shape: CircleBorder(),
        foregroundColor: Colors.white70,
        child: Icon(Icons.description),
        onPressed: () {
          _controller.text = "";
          Dialog();
        },
      ),
    );
  }

  Dialog([int? i]) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(i == null ? "Add Note" : "Edit Note"),
            content: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 150),
              child: TextField(
                cursorColor: Color(0xff454545).withOpacity(.7),
                cursorWidth: 1.5,
                maxLines: null,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffc6c5c6).withOpacity(.5),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Enter your note"),
// textInputAction: TextInputAction.done,
                // onSubmitted: (value) {
                //   print(value);
                // },

                controller: _controller,
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  'Close',
                  style: TextStyle(color: Color(0xff454545)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff454545)),
                    overlayColor: _controller.text.isEmpty
                        ? MaterialStateProperty.all<Color>(Colors.transparent)
                        : MaterialStateProperty.all<Color>(
                            Colors.white70.withOpacity(.1))
                    // Set your desired background color here
                    ),
                child: Text(
                  i == null ? "Add" : "Done",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (!_controller.text.isEmpty) {
                    setState(() {
                      if (i == null) {
                        Notes.add(_controller.text);
                      } else {
                        Notes[i] = _controller.text;
                      }

                      Navigator.of(context).pop();
                      _controller.clear();
                    });
                  }
                },
              )
            ],
          );
        });
  }

  Design() {
    if (!Notes.isEmpty) {
      return Column(
        children: [List()],
      );
    }
    {
      return Center(
          child: Text(
        "Sorry, no notes were found.",
        style: TextStyle(fontSize: 18),
      ));
    }
  }

  List() {
    return Expanded(
      child: ListView.builder(
          itemCount: Notes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text("Note"),
                          content: SingleChildScrollView(child: Text(Notes[index])),
                          actions: [
                            TextButton(
                               style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff454545)),
                    overlayColor: MaterialStateProperty.all<Color>(
                            Colors.white70.withOpacity(.1))
                    // Set your desired background color here
                    ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Okay',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ]);
                    });
              },
              contentPadding: EdgeInsets.only(
                  top: index == 0 ? 5 : 1, left: 16, right: 16, bottom: 1),
              title: Text(
                Notes[index].trim(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              leading: CircleAvatar(
                backgroundColor: Color(0xff252525),
                child: Text((index + 1).toString()),
                foregroundColor: Colors.white70,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  onPressed: () {
                    _controller.text = Notes[index];
                    Dialog(index);
                  },
                  icon: Icon(Icons.edit_document),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      Notes.removeAt(index);
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
              ]),
            );
          }),
    );
  }
}

var _controller = TextEditingController();

// var Notes = []; //EMPTY NOTES

//THESE DEMO DATAS ARE ADDED BY CHATGPT

var Notes = [
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
];
