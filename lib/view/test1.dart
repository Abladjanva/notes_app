import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.deepPurple,
            leading: Icon(Icons.menu),
            pinned: true,
            floating: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.red,
              ),
              title: Text('Instagram'),
              centerTitle: false,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: 300,
                    width: 402,
                    color: Colors.red,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TabBar(tabs: [
                      Tab(
                        icon: Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Tab(
                        text: 'Reels',
                      ),
                      Tab(
                        text: 'Tags',
                      )
                    ]),
                  )
                ];
              },
              body: TabBarView(children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisExtent: 200),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.red,
                        margin: EdgeInsets.all(10),
                      );
                    }),
                GridView.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisExtent: 200),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.blue,
                        margin: EdgeInsets.all(10),
                      );
                    })
              ])),
        ));
  }
}

class InstagramPage extends StatefulWidget {
  const InstagramPage({super.key});

  @override
  State<InstagramPage> createState() => _InstagramPageState();
}

class _InstagramPageState extends State<InstagramPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.black,
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Container(
                      height: 290,
                      width: double.infinity,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 150.0),
                                  child: Text(
                                    "Usersname",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(children: [
                                    Container(
                                      height: 88,
                                      width: 88,
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 2.5),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.blueGrey),
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 53, left: 65),
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 3),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Colors.white),
                                        child: const Center(
                                            child: const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 17,
                                        )),
                                      ),
                                    ),
                                  ]),
                                  Column(
                                    spacing: 5,
                                    children: [
                                      Text(
                                        "1",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        'Posts',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Column(
                                    spacing: 5,
                                    children: [
                                      Text(
                                        "88",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        'Followers',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Column(
                                    spacing: 5,
                                    children: [
                                      Text(
                                        "88",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        'Following',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, right: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "permettez - vous de briller sans desirer etre vu",
                                  style: GoogleFonts.romanesco(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                height: 32,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 61, 22, 204),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    'Follow',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TabBar(tabs: [
                      Tab(
                        icon: Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Tab(
                        icon: Icon(Icons.play_arrow_rounded, color: Colors.white,),
                      ),
                      Tab(
                        icon: Icon(Icons.play_arrow_rounded, color: Colors.white,),
                      )
                    ]),
                  )
                ];
              },
              body: TabBarView(children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisExtent: 200),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.red,
                        margin: EdgeInsets.all(10),
                      );
                    }),
                GridView.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisExtent: 200),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.blue,
                        margin: EdgeInsets.all(10),
                      );
                    }),
                GridView.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisExtent: 200),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.black,
                        margin: EdgeInsets.all(10),
                      );
                    })
              ]),
            )));
  }
}
