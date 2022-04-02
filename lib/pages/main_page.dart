import 'package:flutter/material.dart';
import 'package:untitled/service/socket_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    SocketService.connectSocketChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Socket"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: StreamBuilder(
          stream: SocketService.channel.stream,
          builder: (context, snapshot) {
            return Center(
              child: Text(
                snapshot.hasData ? '${snapshot.data}' : 'No data',
                style: const TextStyle(fontSize: 22),
              ),
            );
          },
        ),
      ),
    );
  }
}
