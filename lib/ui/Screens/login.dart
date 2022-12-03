import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_hospital/ui/Screens/home_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? isVisible;
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    isVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var borderStyle = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(15),
    );
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login to Dr.Sameh',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.alternate_email,
                      color: Colors.black,
                    ),
                    enabledBorder: borderStyle,
                    hintText: 'zzzzz@gmail.com',
                    border: borderStyle,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: passController,
                  obscureText: !isVisible!,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.key,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          isVisible! ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible!;
                        });
                      },
                      color: Colors.black,
                    ),
                    enabledBorder: borderStyle,
                    hintText: '********',
                    border: borderStyle,
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: MaterialButton(
                      color: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      onPressed: () {
                        auth
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passController.text)
                            .then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        });
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 75),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 75),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () {
                        signInWithGoogle()
                            .then((value) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                )));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Image.asset('images/google.png'),
                          ),
                          const SizedBox(width: 75),
                          const Text(
                            'Google',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 75),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken);
    return await auth.signInWithCredential(authCredential);
  }
}
