import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp_ui_clone/Models/PostsModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  List<PostsModel> postList = [];
  Future<List<PostsModel>> fetchPosts() async {
    var response = await http.get(Uri.parse(apiUrl));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200) {
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }
    else{
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: const Text('WhatsApp'),
          bottom: const TabBar(
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
            const Icon(Icons.search),
            const SizedBox(
              width: 10,
            ),
            PopupMenuButton(
                icon: const Icon(Icons.more_horiz_outlined),
                itemBuilder: (context) => [
                      const PopupMenuItem(value: '1', child: Text('New Group')),
                      const PopupMenuItem(value: '2', child: Text('Settings')),
                      const PopupMenuItem(value: '3', child: Text('Logout')),
                    ]),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: TabBarView(children: [
          const Text('1'),
          FutureBuilder(future: fetchPosts(), builder: (context, snapshot){
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);
            }
            else{
              return ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(
                        'https://lens-storage.storage.googleapis.com/webp/7230448a-e0f6-4a6e-8ecc-f654ce2d8d56'),
                  ),
                  title: const Text('John Wick'),
                  subtitle: Text(postList[index].title.toString(), maxLines: 1,),
                  // subtitle: Text('Where is my Dog??'),
                  trailing: const Text('6.36 PM'),
                );
              });
            }
          }),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 3)),
                      child: CircleAvatar(
                          child: index % 5 == 0
                              ? Image.network(
                                  'https://lens-storage.storage.googleapis.com/webp/7230448a-e0f6-4a6e-8ecc-f654ce2d8d56')
                              : Image.network(
                                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3081f7b3-6d67-4487-a4b3-89f612feb7aa/dflmnfe-905956d9-61a4-4887-8428-0435d16b5b44.png/v1/fill/w_1280,h_1280/sherlock_holmes_profile_pic__by_weirdgurl32_dflmnfe-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTI4MCIsInBhdGgiOiJcL2ZcLzMwODFmN2IzLTZkNjctNDQ4Ny1hNGIzLTg5ZjYxMmZlYjdhYVwvZGZsbW5mZS05MDU5NTZkOS02MWE0LTQ4ODctODQyOC0wNDM1ZDE2YjViNDQucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.cJy_xv2pPdczUW8RcxD9ScqkclzZLgk_73AhJUlBMKM')),
                    ),
                    title: index % 5 == 0
                        ? const Text('John Wick')
                        : const Text('Sharlock Holmes'),
                    subtitle:
                        index % 5 == 0 ? const Text('20m ago') : const Text('10m ago'));
              }),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: CircleAvatar(
                        child: index % 5 == 0
                            ? Image.network(
                                'https://lens-storage.storage.googleapis.com/webp/7230448a-e0f6-4a6e-8ecc-f654ce2d8d56')
                            : Image.network(
                                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3081f7b3-6d67-4487-a4b3-89f612feb7aa/dflmnfe-905956d9-61a4-4887-8428-0435d16b5b44.png/v1/fill/w_1280,h_1280/sherlock_holmes_profile_pic__by_weirdgurl32_dflmnfe-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTI4MCIsInBhdGgiOiJcL2ZcLzMwODFmN2IzLTZkNjctNDQ4Ny1hNGIzLTg5ZjYxMmZlYjdhYVwvZGZsbW5mZS05MDU5NTZkOS02MWE0LTQ4ODctODQyOC0wNDM1ZDE2YjViNDQucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.cJy_xv2pPdczUW8RcxD9ScqkclzZLgk_73AhJUlBMKM')),
                    title: index % 5 == 0
                        ? const Text('John Wick')
                        : const Text('Sharlock Holmes'),
                    subtitle: Row(
                      children: [
                        Icon(
                          index % 3 == 0
                              ? CupertinoIcons.arrow_down_left
                              : CupertinoIcons.arrow_up_right,
                          size: 20,
                          color: index % 3 == 0 ? Colors.red : Colors.green,
                        ),
                        const Text(' September 25, 11:31 PM'),
                      ],
                    ),
                    trailing: const Icon(Icons.call));
              }),
        ]),
      ),
    );
  }
}
