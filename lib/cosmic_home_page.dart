import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/planets_info.dart';

class CosmicHomePage extends StatefulWidget {
  const CosmicHomePage({super.key});

  @override
  State<CosmicHomePage> createState() => _CosmicHomePageState();
}

class _CosmicHomePageState extends State<CosmicHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: Stack(children: [
        Image.asset(
          'assets/images/cosmic.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 844,
        ),
        Column(
          children: [
            InkWell(
              child: Container(
                width: double.infinity,
                height: 128,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.black.withOpacity(0.5),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 30, left: 30, top: 50, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Color(0xFF091522),
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Center(
                          child: Image.asset('assets/images/settings.png'),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Milky Way",
                            style: GoogleFonts.figtree(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF8D8E99)),
                          ),
                          Text(
                            "Solar System",
                            style: GoogleFonts.figtree(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      InkWell(
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Color(0xFF091522),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: Image.asset('assets/images/profile.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 24),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlanetsInfo()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 107,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 6,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 4), 
                            ),
                          ],
                          borderRadius: BorderRadius.circular(28),
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF00E5E5).withOpacity(0.5),
                                        Color(0xFF72A5F2).withOpacity(0.5),
                                        Color(0xFFE961FF).withOpacity(0.5),
                                      ],
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.srcATop,
                                  child: Image.asset(
                                    'assets/images/mars.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Mars",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 26),
              child: Column(
                spacing: 26,
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.black.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 24, left: 24, top: 21),
                      child: Column(
                        spacing: 15,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Planet of the day",
                              style: GoogleFonts.figtree(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF00E5E5).withOpacity(0.5),
                                        Color(0xFF72A5F2).withOpacity(0.5),
                                        Color(0xFFE961FF).withOpacity(0.5),
                                      ],
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.srcATop,
                                  child: Image.asset(
                                    'assets/images/mars.png',
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mars',
                                    style: GoogleFonts.figtree(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF11DCE8)),
                                  ),
                                  SizedBox(
                                    width: 220,
                                    child: Text(
                                      "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, only being larger than Mercury. In the English language, Mars is named for the Roman god of war.",
                                      style: GoogleFonts.figtree(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 226, bottom: 9),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlanetsInfo()));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Details",
                                    style: GoogleFonts.figtree(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  Image.asset('assets/images/icon_more.png')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.black.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 21, left: 24, right: 24),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Solar System",
                            style: GoogleFonts.figtree(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          Text(
                            "The Solar System[c] is the gravitationally bound system of the Sun and the objects that orbit it. It formed 4.6 billion years ago from the gravitational collapse of a giant interstellar molecular cloud. The vast majority (99.86%) of the system's mass is in the Sun, with most of the remaining mass contained in the planet Jupiter. The four inner system planets—Mercury, Venus, Earth and Mars—are terrestrial planets, being composed primarily of rock and metal. The four giant planets of the outer system are substantially larger and more massive than the terrestrials.",
                            style: GoogleFonts.figtree(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
