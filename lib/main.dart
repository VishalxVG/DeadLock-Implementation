import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DeadLock Implementation',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color singelTapColorP = Colors.blueAccent;
  Color doubleTapColorP = Colors.blueAccent;
  Color longPressColorP = Colors.blueAccent;
  Color singelTapColorR = Colors.blueAccent;
  Color doubleTapColorR = Colors.blueAccent;
  Color longPressColorR = Colors.blueAccent;

  bool singleTapOnR1 = false;
  bool singleTapOnR2 = false;
  bool singleTapOnR3 = false;

  bool doubleTapOnR1 = false;
  bool doubleTapOnR2 = false;
  bool doubleTapOnR3 = false;

  bool longPressOnR1 = false;
  bool longPressOnR2 = false;
  bool longPressOnR3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "𝙳𝚎𝚊𝚍𝙻𝚘𝚌𝚔 𝙸𝚖𝚙𝚕𝚎𝚖𝚎𝚗𝚝𝚊𝚝𝚒𝚘𝚗",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 13, 171, 180),
        centerTitle: true,
        elevation: 1,
        // foregroundColor: Colors.amber,
        shadowColor: Colors.grey,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "There are 3 Process and 3 Resouces\nSingleTap on any process to assign a color to it.\nThen do the same to assign a resouce to a process.\nSimilarly use DoubleTap and LongPress to assign a\nprocess and then a resouce to a process . Then use\nthe below butons to check for deadlock and if \noccured release a deadlock",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.amber,
              height: 400,
              width: 700,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _processBoxes(),
                  _resourcesBoxes(),
                ],
              ),
            ),
            _checkForDeadLockButton(),
            _resetDeadLockButton(),
          ],
        ),
      ),
    );
  }

  ElevatedButton _resetDeadLockButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          singelTapColorP = Colors.blueAccent;
          doubleTapColorP = Colors.blueAccent;
          longPressColorP = Colors.blueAccent;
          singelTapColorR = Colors.blueAccent;
          doubleTapColorR = Colors.blueAccent;
          longPressColorR = Colors.blueAccent;

          singleTapOnR1 = false;
          singleTapOnR2 = false;
          singleTapOnR3 = false;

          doubleTapOnR1 = false;
          doubleTapOnR2 = false;
          doubleTapOnR3 = false;

          longPressOnR1 = false;
          longPressOnR2 = false;
          longPressOnR3 = false;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 13, 171, 180),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size(160, 50),
      ),
      child: const Text(
        "Reset DeadLock",
      ),
    );
  }

  ElevatedButton _checkForDeadLockButton() {
    return ElevatedButton(
      onPressed: () {
        if (singleTapOnR1 == true &&
            singleTapOnR2 == true &&
            singleTapOnR3 == true) {
          _showCustomDialog(context);
        } else if (doubleTapOnR1 == true &&
            doubleTapOnR2 == true &&
            doubleTapOnR3 == true) {
          _showCustomDialog(context);
        } else if (longPressOnR1 == true &&
            longPressOnR2 == true &&
            longPressOnR3 == true) {
          _showCustomDialog(context);
        } else {
          _showDialogBox(context);
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 13, 171, 180),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(100, 50)),
      child: const Text(
        "Check For DeadLock",
      ),
    );
  }

  Column _resourcesBoxes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              singelTapColorR = Colors.redAccent;
              singleTapOnR1 = true;
            });
          },
          onDoubleTap: () {
            setState(() {
              singelTapColorR = Colors.greenAccent;
              doubleTapOnR1 = true;
            });
          },
          onLongPress: () {
            setState(() {
              singelTapColorR = Colors.lime;
              longPressOnR1 = true;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: singelTapColorR,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            height: 60,
            width: 60,
            child: const Center(
              child: Text(
                "R1",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              doubleTapColorR = Colors.redAccent;
              singleTapOnR2 = true;
            });
          },
          onDoubleTap: () {
            setState(() {
              doubleTapColorR = Colors.greenAccent;
              doubleTapOnR2 = true;
            });
          },
          onLongPress: () {
            setState(() {
              doubleTapColorR = Colors.lime;
              longPressOnR2 = true;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: doubleTapColorR,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: const Center(
              child: Text(
                "R2",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              longPressColorR = Colors.redAccent;
              singleTapOnR3 = true;
            });
          },
          onDoubleTap: () {
            setState(() {
              longPressColorR = Colors.greenAccent;
              doubleTapOnR3 = true;
            });
          },
          onLongPress: () {
            setState(() {
              longPressColorR = Colors.lime;
              longPressOnR3 = true;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: longPressColorR,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            height: 60,
            width: 60,
            child: const Center(
              child: Text(
                "R3",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _processBoxes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // PROCESS P1
        GestureDetector(
          onTap: () {
            setState(() {
              singelTapColorP = Colors.redAccent;
            });
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.all(8),
            // color: Colors.blueAccent,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: singelTapColorP,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            duration: const Duration(milliseconds: 300),
            child: const Center(
              child: Text(
                "P1",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),

        // PROCESS P2

        GestureDetector(
          onDoubleTap: () {
            setState(() {
              doubleTapColorP = Colors.greenAccent;
            });
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.all(8),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: doubleTapColorP,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            duration: const Duration(milliseconds: 300),
            child: const Center(
              child: Text(
                "P2",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),

        // PROCESS P3

        GestureDetector(
          onLongPress: () {
            setState(() {
              longPressColorP = Colors.lime;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: longPressColorP,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            height: 60,
            width: 60,
            child: const Center(
              child: Text(
                "P3",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('DeadLock does not Occur'),
          content: const Text(
              'Since each resouce is in position of a single process no deadlock occurs'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deadlock Occurs'),
          content: const Text(
              'Process is requesting a resouce which is in hold of other process'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
