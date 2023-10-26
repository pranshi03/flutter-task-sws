import '../../common_libs.dart';
class LoginButton extends StatelessWidget {
  final String img;
  final String text;
  final void Function()? function;
  const LoginButton({super.key, required this.img, required this.text, this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 3,
            backgroundColor: CLR.white,

            foregroundColor: CLR.black),
        onPressed: function,

        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Image.asset(
                img,
                width: 20,
                height: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child:  Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



