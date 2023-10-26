

import '../common_libs.dart';

class BaseWidget extends StatefulWidget {
  final Widget child;
  final bool isLoading;

  const BaseWidget({required this.child, this.isLoading = false, Key? key})
      : super(key: key);

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Visibility(
          visible: widget.isLoading,
          child: Container(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        Center(
          child: Visibility(
            visible: widget.isLoading,
            child: const SizedBox(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                color: CLR.goldShade,
              ),
            ),
          ),
        ),
        Center(
          child: Visibility(
            visible: widget.isLoading,
            child: Image.asset(
              ImagePaths.appLogo,
              width: 45,
              height: 45,
            ),
          ),
        ),
      ],
    );
  }
}
