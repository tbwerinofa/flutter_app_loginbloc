import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'authenticationbloc.dart';
import 'authenticationevent.dart';
import 'incident.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(

        child:  Center(
      child:   Row(children: <Widget>[

          Expanded(
            child: RaisedButton(
              onPressed: (){
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
              child: Text('Logout'),
              color: Colors.blue,
              textColor: Colors.white,
              splashColor: Colors.grey,
            ),
          ),
          Expanded(
            child:RaisedButton(
              onPressed: (){
                _navForgotPassword(context);
              },
              child: Text('Incidents'),
              color: Colors.white,
              textColor: Colors.black,
              splashColor: Colors.grey,
            ),
          ),
        ],
        ),
       /*
        child: Center(
          child: RaisedButton(
            child: Text('Logout-4'),
            onPressed: (){
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          ),
        ),*/
      ),
      ),
    );
  }

  void _navForgotPassword(BuildContext context)
  {
    Navigator.push(context,new MaterialPageRoute(builder: (context)=> new IncidentController()));
  }

}
