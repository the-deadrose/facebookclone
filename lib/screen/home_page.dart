import 'package:facebook_clone/constant/color.dart';
import 'package:facebook_clone/model/story_model.dart';
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
  late ScrollController _scrollController;
  bool isScrolling = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0) {
        setState(() {
          isScrolling = true;
        });
      } else {
        setState(() {
          isScrolling = false;
        });
      }
    });
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
                  const SizedBox(
                    height: 25,
                  ),
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
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    // story section
                    SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: stories.length,
                              itemBuilder: (context, index) {
                                print(index);
                                return Container(
                                    width: 150,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey[350]!)),
                                    child: index == 0
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 225,
                                                  child: Stack(
                                                    children: [
                                                      Image.asset(
                                                          'assets/images/profile.jpg',
                                                          height: 200,
                                                          fit:
                                                              BoxFit.fitHeight),
                                                      Positioned(
                                                        top: 175,
                                                        right: 50,
                                                        child: Container(
                                                          height: 50,
                                                          width: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    6),
                                                            height: 40,
                                                            width: 40,
                                                            decoration: BoxDecoration(
                                                                color: AppColor
                                                                    .primary,
                                                                shape: BoxShape
                                                                    .circle),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  'Create Story',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 0.5),
                                                )
                                              ],
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Stack(
                                              children: [
                                                Image.asset(
                                                  stories[index].storyImage,
                                                  height: 250,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                                Positioned(
                                                    bottom: 10,
                                                    left: 10,
                                                    child: Text(
                                                      stories[index].name,
                                                      style: TextStyle(
                                                        shadows: [
                                                          Shadow(
                                                              blurRadius: 2,
                                                              color:
                                                                  Colors.black)
                                                        ],
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 0.5,
                                                      ),
                                                    )),
                                                Positioned(
                                                    top: 10,
                                                    left: 10,
                                                    child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: AppColor
                                                                    .primary,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: CircleAvatar(
                                                          backgroundImage:
                                                              AssetImage(stories[
                                                                      index]
                                                                  .profileImage),
                                                        )))
                                              ],
                                            ),
                                          ));
                              },
                            ),
                            Positioned(
                                top: 100,
                                left: 15,
                                child: Visibility(
                                  visible: isScrolling,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                        onPressed: () {
                                          final double itemWidth = 160;
                                          final double scrollOffset =
                                              itemWidth * 4;
                                          final double newScrollOffset =
                                              _scrollController.offset -
                                                  scrollOffset;

                                          _scrollController.animateTo(
                                            newScrollOffset.clamp(
                                                0,
                                                double
                                                    .infinity), // Ensure the offset doesn't go below 0
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeInOut,
                                          );
                                        },
                                        icon: Icon(
                                            Icons.arrow_back_ios_new_outlined,
                                            size: 20)),
                                  ),
                                )),
                            Positioned(
                                top: 100,
                                right: 15,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () {
                                        final double itemWidth =
                                            160; // Assuming each story item is 160 pixels wide
                                        final double scrollOffset = itemWidth *
                                            4; // Scroll four items at a time

                                        final double maxScrollExtent =
                                            _scrollController
                                                .position.maxScrollExtent;
                                        final double newScrollOffset =
                                            _scrollController.offset +
                                                scrollOffset;

                                        _scrollController.animateTo(
                                          newScrollOffset.clamp(
                                              0, maxScrollExtent),
                                          duration: Duration(
                                              milliseconds:
                                                  500), // Adjust the duration as needed
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      icon: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 20)),
                                ))
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 120,
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.grey[350]!,
                                blurRadius: 2)
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/profile.jpg'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  alignment: Alignment.centerLeft,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'What\'s on your mind, Bishal?',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey[600]),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            thickness: 0.6,
                            height: 3,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/video-stream.png',
                                      width: 28,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Live Video',
                                      style: TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/photos.png',
                                      width: 40,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Photo/Video',
                                      style: TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/reel.png',
                                      width: 28,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Reel',
                                      style: TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          // constraints: BoxConstraints(
                          //     maxHeight:
                          //         MediaQuery.of(context).size.height * 0.7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                        'assets/images/profile.jpg',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Bishal Shrestha'),
                                        Row(
                                          children: [
                                            Text('4h.'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.people,
                                              color: Colors.grey,
                                              size: 20,
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/ranjita_story.jpg',
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
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
