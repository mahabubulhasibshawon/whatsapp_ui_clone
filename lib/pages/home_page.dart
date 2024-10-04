import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: Text('WhatsApp'),
          bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(child: Icon(Icons.camera_alt_outlined)),
                Tab(child: Text('Chats')),
                Tab(child: Text('Status')),
                Tab(child: Text('Call')),
              ]),
          actions: [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            PopupMenuButton(
                icon: Icon(Icons.more_horiz_outlined),
                itemBuilder: (context) => [
                      PopupMenuItem(value: '1', child: Text('New Group')),
                      PopupMenuItem(value: '2', child: Text('Settings')),
                      PopupMenuItem(value: '3', child: Text('Logout')),
                    ]),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: TabBarView(children: [
          Text('1'),
          ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Image.network(
                    'https://lens-storage.storage.googleapis.com/webp/7230448a-e0f6-4a6e-8ecc-f654ce2d8d56'),
              ),
              title: Text('John Wick'),
              subtitle: Text('Where is my Dog??'),
              trailing: Text('6.36 PM'),
            );
          }),
          Text('1'),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                          'https://lens-storage.storage.googleapis.com/webp/7230448a-e0f6-4a6e-8ecc-f654ce2d8d56'),
                    ),
                    title: Text('John Wick'),
                    subtitle: Row(
                      children: [
                        Icon(
                          index % 3 == 0 ? CupertinoIcons.arrow_down_left  : CupertinoIcons.arrow_up_right,
                          size: 20,
                          color: index % 3 == 0 ? Colors.red :  Colors.green,
                        ),
                        Text(' September 25, 11:31 PM'),
                      ],
                    ),
                    trailing: Icon(Icons.call));
              }),
        ]),
      ),
    );
  }
}
