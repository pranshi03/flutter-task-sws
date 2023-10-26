import 'package:firebase_auth/firebase_auth.dart';
import '../../common_libs.dart';
import '../../services/auth_services.dart';
import '../dashboard/dashboard.dart';
import 'widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 45,
                  fontFamily: Fonts.AvenirNextLTProBold,
                  color: CLR.black),
            ),
          ),
          LoginButton(
            img: ImagePaths.googleLogo,
            text: 'Login with Google',
            function: () async {
              try {
                await authServices.signInwithGoogle().then((value) => {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const Dashboard())),
                      Alerts.showToast("Logged in Successfully", context),
                    });
              } catch (e) {
                if (e is FirebaseAuthException) {
                  print(e.message!);
                }
              }
            },
          ),
           LoginButton(
              img: ImagePaths.appleLogo,
            text: 'Login with Apple ID',
          function: () async {
            try {
              await authServices.signInWithApple().then((value) => {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Dashboard())),
                Alerts.showToast("Logged in Successfully", context),
              });
            } catch (e) {
              if (e is FirebaseAuthException) {
                print(e.message!);
              }
            }
          },
          ),
        ],
      ),
    );
  }
}
