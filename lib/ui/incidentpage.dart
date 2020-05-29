import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapploginbloc/authenticationbloc.dart';

import '../UserRepository.dart';
import '../loginbloc.dart';
import '../loginform.dart';
import 'incidentform.dart';

class IncidentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incident Capture'),
              ),
      body:  IncidentForm(),
    );
  }
}
