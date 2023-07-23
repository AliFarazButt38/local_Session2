import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:localsession/local.dart';

class DashboardPage extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;

  const DashboardPage({
    required this.sessionStateStream,
    Key? key,
  }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Dashboard page"),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Local(sessionStateStream: widget.sessionStateStream)));
            }, child: Text('to local'))
            
            // Add any other widgets specific to the DashboardPage here
          ],
        ),
      ),
    );
  }
}
