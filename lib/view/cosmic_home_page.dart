import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/button.dart';
import 'package:notes_app/favorite_planets.dart';
import 'package:notes_app/firebase_features/cubit/planets_cubit.dart';
import 'package:notes_app/firebase_features/models/planets_model.dart';

import 'package:notes_app/view/planets_info.dart';

class CosmicHomePage extends StatefulWidget {
  const CosmicHomePage({super.key});

  @override
  State<CosmicHomePage> createState() => _CosmicHomePageState();
}

class _CosmicHomePageState extends State<CosmicHomePage> {
  @override
  @override
  void initState() {
    super.initState();
    context.read<PlanetsCubit>().loadPlanets();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/cosmic.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 844,
          ),
          Column(children: [
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
            SizedBox(
                height: 70,
                child: BlocBuilder<PlanetsCubit, PlanetsState>(
                  builder: (context, state) {
                    if (state is PlanetsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PlanetError) {
                      return Center(
                          child: Text(state.message,
                              style: TextStyle(color: Colors.red)));
                    } else if (state is PlanetsSuccess) {
                      final planets = state.planets;

                      return Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          height: 70,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: 24),
                            itemCount: planets.length,
                            itemBuilder: (context, index) {
                              final planet = state.planets[index];
                              return InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (_) => PlanetCard(planet: planet),
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                  );
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
                                        offset: Offset(0, 4),
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
                                                  Color(0xFF00E5E5)
                                                      .withOpacity(0.5),
                                                  Color(0xFF72A5F2)
                                                      .withOpacity(0.5),
                                                  Color(0xFFE961FF)
                                                      .withOpacity(0.5),
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                planet.image,
                                                width: 24,
                                                height: 24,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Icon(Icons.error,
                                                        color: Colors.white,
                                                        size: 24),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            planet.name.toLowerCase(),
                                            style: GoogleFonts.figtree(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
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
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                )),
          ]),
          Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, top: 220),
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
                          padding: const EdgeInsets.only(left: 226, bottom: 9),
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
    );
  }
}

class PlanetCard extends StatefulWidget {
  final PlanetsModel planet;

  const PlanetCard({super.key, required this.planet});

  @override
  State<PlanetCard> createState() => _PlanetCardState();
}

class _PlanetCardState extends State<PlanetCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    child: Image.asset(
                      'assets/images/favorite.png',
                     
                    ),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      widget.planet.image,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.planet.name,
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
                        Text("${widget.planet.mass}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800))
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
                          widget.planet.gravity.toString(),
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
                          widget.planet.hours.toString(),
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
                          widget.planet.velocity.toString(),
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
                          widget.planet.temp.toString(),
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
                          widget.planet.distance.toString(),
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
    );
  }
}
