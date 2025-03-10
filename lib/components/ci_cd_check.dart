import 'package:flutter/material.dart';

class CICDCheck extends StatelessWidget {
  const CICDCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hey this is CI/CD check example'),
      ),
      body: Center(
        child: Text('Welcome to the example of the CICD'),
      ),
    );
  }
}
