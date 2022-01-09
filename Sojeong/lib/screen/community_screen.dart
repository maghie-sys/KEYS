import 'package:flutter/material.dart';

class CommuityScreen extends StatefulWidget {
  _CommuityScreenState createState() => _CommuityScreenState();
}

class _CommuityScreenState extends State<CommuityScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20.0),
        child: AppBar(
          title: Text('커뮤니티'),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        
      ),
      body: Container(
        child: Row(

        ),
      ),
    );
  }
}
