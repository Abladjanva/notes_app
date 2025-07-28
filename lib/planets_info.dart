import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/button.dart';
import 'package:notes_app/favorite_planets.dart';

class PlanetsInfo extends StatefulWidget {
  const PlanetsInfo({super.key});

  @override
  State<PlanetsInfo> createState() => _PlanetsInfoState();
}

class _PlanetsInfoState extends State<PlanetsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/earthh.png',
            fit: BoxFit.cover,
            height: 900,
          ),
          Container(
            width: double.infinity,
            height: 900,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Color(0xFF00E5E5).withOpacity(0.7),
                  Color(0xFF72A5F2).withOpacity(0.7),
                  Color(0xFFE961FF).withOpacity(0.7),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60, right: 24, left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Button()));
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.black.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/arrowback.png'),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoritePlanets()));
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.black.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/favorite.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 108.0),
            child: Container(
              height: 555,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
                color: Colors.black.withOpacity(0.5),
              ),
              margin: EdgeInsets.only(top: 181),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 230.0),
            child: Column(
              spacing: 20,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFF00E5E5).withOpacity(0.5),
                          Color(0xFF72A5F2).withOpacity(0.5),
                          Color(0xFFE961FF).withOpacity(0.5),
                        ],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                    child: Image.asset(
                      'assets/images/earth.png',
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Earth",
                    style: GoogleFonts.figtree(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60, left: 60, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: 8,
                        children: [
                          Image.asset("assets/images/icon.png"),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Mass",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "(1024kg)",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "5.97",
                            style: GoogleFonts.figtree(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Image.asset("assets/images/icon1.png"),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Gravity",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "(m/s2)",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "9.8",
                            style: GoogleFonts.figtree(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Image.asset("assets/images/icon2.png"),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Day",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "(hours)",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "24",
                            style: GoogleFonts.figtree(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 60, left: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        spacing: 8,
                        children: [
                          Image.asset("assets/images/icon3.png"),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Esc. Velocity",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "(km/s)",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "11.2",
                            style: GoogleFonts.figtree(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        spacing: 5,
                        children: [
                          Image.asset("assets/images/icon4.png"),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Mean",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Temp (C)",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "15",
                            style: GoogleFonts.figtree(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Image.asset("assets/images/icon5.png"),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Distance from",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Sun (106 km)",
                                  style: GoogleFonts.figtree(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "5.97",
                            style: GoogleFonts.figtree(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: 146,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFF00E5E5),
                            Color(0xFF72A5F2),
                            Color(0xFFE961FF),
                          ],
                          stops: [0.0, 0.5, 1.0],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Visit",
                          style: GoogleFonts.figtree(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
