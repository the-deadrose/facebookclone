import 'package:facebook_clone/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey[200],
        backgroundColor: Colors.white,
        // toolbarHeight: 50,
        leadingWidth: 450,
        elevation: 0.8,

        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              Image.asset(
                'assets/images/facebook.png',
              ),
              const SizedBox(width: 10),
              SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                      decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 40,
                    ),
                    hintText: 'Search Facebook',
                  ))),
            ],
          ),
        ),
        centerTitle: true,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.38,
          height: 55,
          child: TabBar(
              controller: _tabController,
              indicatorColor: AppColor.primary,
              labelColor: AppColor.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(icon: Icon(Icons.home, size: 30)),
                Tab(icon: Icon(Icons.ondemand_video, size: 30)),
                Tab(icon: Icon(Icons.add_business_outlined, size: 30)),
                Tab(icon: Icon(Icons.group, size: 30)),
                Tab(icon: Icon(Icons.gamepad_outlined, size: 30)),
              ]),
        ),
        actions: [
          Container(
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          Container(
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          Container(
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200], shape: BoxShape.circle),
              width: 40,
              height: 40,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              )),
          const SizedBox(width: 10),
        ],
      ),
      backgroundColor: AppColor.homeBGColor,
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    title: Text('Bishal Shrestha'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  listTile(
                      title: 'Friends',
                      imagePath: 'assets/images/friends_icon.png'),
                  listTile(
                      title: 'Saved', imagePath: 'assets/images/saved.png'),
                  listTile(
                      title: 'Video', imagePath: 'assets/images/video.png'),
                  listTile(title: 'Feeds', imagePath: 'assets/images/feed.png'),
                  listTile(
                      title: 'Groups',
                      imagePath: 'assets/images/social-media.png'),
                  listTile(
                      title: 'Marketplace',
                      imagePath: 'assets/images/market.png'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                              width: 150,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              child: index == 0
                                  ? Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/profile.jpg',
                                        )
                                      ],
                                    )
                                  : Stack(
                                      children: [],
                                    ));
                        },
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}

// make listtile widget

Widget listTile({required String title, required String imagePath}) {
  return ListTile(
    leading: Image.asset(
      imagePath,
      height: 40,
    ),
    title: Text(title),
  );
}
