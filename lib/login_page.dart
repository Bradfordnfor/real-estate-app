import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:real_estate_app/signup_page.dart';
import 'package:real_estate_app/controllers/auth_controller.dart';
import 'package:real_estate_app/responsive_layout.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> with TickerProviderStateMixin {
  final AuthController authController = Get.find<AuthController>();
  bool isChecked = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedHouses() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.home, size: 30, color: Colors.blue),
              ),
              Container(
                width: 80,
                height: 80,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.apartment, size: 40, color: Colors.blue),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.villa, size: 35, color: Colors.blue),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;
    final screenHeight = MediaQuery.of(context).size.height;

    return ResponsiveLayout(
      backgroundColor: Colors.blue.shade50,
      showDrawer: false,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Row(
            children: [
              // Left side - Login Form
              Expanded(
                flex: isWideScreen ? 1 : 1,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWideScreen ? 40 : 20,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isWideScreen) ...[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/backgroundhouse.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                      Container(
                        constraints: BoxConstraints(maxWidth: 400),
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                          color: Color.fromRGBO(60, 163, 247, 0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/Component 1 (2).png',
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  'HOMZ',
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 30),
                            TextField(
                              controller:
                                  authController.loginUsernameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'User name or Email',
                                labelStyle: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromRGBO(245, 222, 179, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(245, 222, 179, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              cursorColor: Color.fromRGBO(245, 222, 179, 0.5),
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(height: 25),
                            TextField(
                              controller:
                                  authController.loginPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(255, 255, 255, 1),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromRGBO(245, 222, 179, 1))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(245, 222, 179, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              cursorColor: Color.fromRGBO(245, 222, 179, 0.5),
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(height: 25),
                            Obx(() => TextButton(
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () => authController.signIn(),
                                  child: authController.isLoading.value
                                      ? CircularProgressIndicator(
                                          color:
                                              Color.fromRGBO(245, 222, 179, 1))
                                      : Text(
                                          'SIGN IN',
                                          style: TextStyle(
                                            fontSize: 28,
                                            color: Color.fromRGBO(
                                                245, 222, 179, 1),
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                )),
                            Row(
                              children: [
                                Checkbox(
                                    activeColor:
                                        Color.fromRGBO(245, 222, 179, 1),
                                    checkColor: Colors.white,
                                    side: BorderSide(
                                      color: Color.fromRGBO(245, 222, 179, 1),
                                    ),
                                    value: isChecked,
                                    onChanged: (newvalue) {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    }),
                                Expanded(
                                  child: Text(
                                    'Remember Password',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromRGBO(245, 222, 179, 1)),
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      color: Color.fromRGBO(245, 222, 179, 1),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account yet?",
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => Signup());
                                  },
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      color: Color.fromRGBO(245, 222, 179, 1),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Right side - Animated Houses (only on wide screens)
              if (isWideScreen)
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Find Your Perfect Home',
                          style: GoogleFonts.raleway(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 40),
                        _buildAnimatedHouses(),
                        SizedBox(height: 40),
                        Text(
                          'Discover thousands of properties\nacross Cameroon',
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            color: Colors.blue.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
