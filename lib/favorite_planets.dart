import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/planets_info.dart';

class FavoritePlanets extends StatefulWidget {
  const FavoritePlanets({super.key});

  @override
  State<FavoritePlanets> createState() => _FavoritePlanetsState();
}

class _FavoritePlanetsState extends State<FavoritePlanets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/cosmic.png',
            fit: BoxFit.cover,
            height: 900,
          ),
          Column(children: [
            Container(
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
                    Text(
                      "Favourites",
                      style: GoogleFonts.figtree(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
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
           Expanded(
  child: ListView.separated(
    scrollDirection: Axis.vertical,
    itemCount: 4,
    separatorBuilder: (context, index) => const SizedBox(height: 0),
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlanetsInfo()),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(right: 24, left: 24, top: 24),
          height: 142,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.black.withOpacity(0.5),
            border: Border.all(
              color: Colors.black.withOpacity(0.7),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 26, right: 29, top: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🪐 Planet image with ShaderMask
                ShaderMask(
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
                    width: 65,
                    height: 65,
                  ),
                ),

                const SizedBox(width: 16), // spacing between image and text

                // 📝 Planet name + description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mars",
                        style: GoogleFonts.figtree(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF11DCE8),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.figtree(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // ❤️ Favorite icon aligned to top-right
                Align(
                  alignment: Alignment.topCenter,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/favorite.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  ),
),

          ])
        ],
      ),
    );
  }
}
