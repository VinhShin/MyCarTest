import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullLoading extends StatelessWidget {
  final bool isLoading;
  FullLoading(this.isLoading);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black12.withOpacity(0.4),
              ),
              Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlue,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            ],
          )
        : Container();
  }
}
