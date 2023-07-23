import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';

import 'dasboard.dart';

class AuthPage extends StatefulWidget {
  AuthPage({
    required this.sessionStateStream,
    this.loggedOutReason = "",
    Key? key,
  }) : super(key: key);

  final StreamController<SessionState> sessionStateStream;
  final String loggedOutReason;

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late String _loggedOutReason;

  @override
  void initState() {
    super.initState();
    _loggedOutReason = widget.loggedOutReason;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_loggedOutReason != "")
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Text(_loggedOutReason),
              ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                widget.sessionStateStream.add(SessionState.startListening);
                _loggedOutReason = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DashboardPage(
                      sessionStateStream: widget.sessionStateStream,
                    ),
                  ),
                );
                setState(() {});
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}