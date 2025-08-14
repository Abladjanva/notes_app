import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSwitched = false;
  bool isChecked = false;
  bool isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Stack(children: [
          Image.asset(
            'assets/images/cosmic.png',
            fit: BoxFit.cover,
            height: 900,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
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
                    spacing: 80,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Button()));
                        },
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
                          child: Center(
                            child: Image.asset('assets/images/arrowback.png'),
                          ),
                        ),
                      ),
                      Text(
                        "Profile",
                        style: GoogleFonts.figtree(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Container(
                  height: 115,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.black.withOpacity(0.5),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.7),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 17, right: 17, top: 0),
                    child: Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF00E5E5).withOpacity(0.2),
                                    Color(0xFF72A5F2).withOpacity(0.2),
                                    Color(0xFFE961FF).withOpacity(0.2),
                                  ],
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.srcATop,
                              child: Image.asset(
                                'assets/images/facee.png',
                                width: 90,
                                height: 90,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Arthur Dent",
                                    style: GoogleFonts.figtree(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Space adventurer',
                                    style: GoogleFonts.figtree(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 77.0, bottom: 55),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/edit.png')),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24),
                child: Container(
                  height: 478,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.black.withOpacity(0.5),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.7),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          spacing: 5,
                          children: [
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeColor: Color(0xFF091522),
                              activeTrackColor: Color(0xFF8D8E99),
                              inactiveThumbColor: Color(0xFF091522),
                              inactiveTrackColor: Color(0xFF11DCE8),
                            ),
                            Text(
                              "Show planetary progress",
                              style: GoogleFonts.figtree(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 34),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/circle.png'),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: 24, left: 24, top: 20),
                          child: Row(
                            spacing: 5,
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isChecked = newValue!;
                                  });
                                },
                                activeColor: Color(0xFF000000),
                                checkColor: Color(0xFF11DCE8),
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Color(0xFF000000);
                                    }
                                    return Color(0xFF000000);
                                  },
                                ),
                                side: BorderSide(
                                    color: Color(0xFF303030), width: 1),
                              ),
                              Text(
                                'Show me in Planet Rating',
                                style: GoogleFonts.figtree(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: 24, left: 24, top: 10),
                          child: Row(
                            spacing: 5,
                            children: [
                              Checkbox(
                                value: isChecked1,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isChecked1 = newValue!;
                                  });
                                },
                                activeColor: Color(0xFF000000),
                                checkColor: Color(0xFF11DCE8),
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Color(0xFF000000);
                                    }
                                    return Color(0xFF000000);
                                  },
                                ),
                                side: BorderSide(
                                    color: Color(0xFF303030), width: 1),
                              ),
                              Text(
                                'Notifications',
                                style: GoogleFonts.figtree(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          )
        ]));
  }
}
