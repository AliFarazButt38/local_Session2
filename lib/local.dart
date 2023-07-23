import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_session_timeout/local_session_timeout.dart';


class Local extends StatefulWidget {
  final StreamController<SessionState> sessionStateStream;

  const Local({
   required this.sessionStateStream,
    Key? key,
  }) : super(key: key);

  @override
  State<Local> createState() => _LocalState();
}

class _LocalState extends State<Local> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
