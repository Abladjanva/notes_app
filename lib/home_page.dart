import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/cosmic_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/cosmic.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 58,
                        right: 80,
                        left: 80,
                      ),
                      child: Center(
                        child: Image.asset('assets/images/Vector.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 160),
                      child: Container(
                        width: double.infinity,
                        height: 542,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(38)),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(48, 38, 48, 0),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Sign in",
                                      style: GoogleFonts.figtree(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ))),
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: GoogleFonts.figtree(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF8D8E99)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF3A3A42), width: 1),
                                      borderRadius: BorderRadius.circular(44),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(44),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1),
                                      borderRadius: BorderRadius.circular(44),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF3A3A42), width: 1),
                                      borderRadius: BorderRadius.circular(44),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFF091522),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: TextField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: GoogleFonts.figtree(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF8D8E99)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF3A3A42), width: 1),
                                      borderRadius: BorderRadius.circular(44),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(44),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1),
                                      borderRadius: BorderRadius.circular(44),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF3A3A42), width: 1),
                                      borderRadius: BorderRadius.circular(44),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFF091522),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Forgot Password',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF11DCE8)),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CosmicHomePage()));
                                    },
                                    child: Container(
                                      height: 45,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(45),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
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
                                          "Sign in",
                                          style: GoogleFonts.figtree(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 0.2,
                                      width: 82,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "or sign in using",
                                      style: GoogleFonts.figtree(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8D8E99)),
                                    ),
                                    Container(
                                      height: 0.2,
                                      width: 82,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 24),
                                child: Row(
                                  spacing: 10,
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        child: Image.asset(
                                            'assets/images/twitter.png'),
                                      ),
                                    ),
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
                                        child: Image.asset(
                                            'assets/images/facebook.png'),
                                      ),
                                    ),
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
                                        child: Image.asset(
                                            'assets/images/google.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 3,
                                  children: [
                                    Text(
                                      "Don’t have an account?",
                                      style: GoogleFonts.figtree(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8D8E99)),
                                    ),
                                     Text(
                                      "Sign up",
                                      style: GoogleFonts.figtree(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF11DCE8)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
