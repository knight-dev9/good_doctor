import 'package:google_fonts/google_fonts.dart';

import '../exporter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  checkUser() async {
    final userId = await Session.getUserId();
    if (userId.isNotEmpty) {
      // OPEN DASHBOARD
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: InstaBG(
            primaryColors: [Palette.primaryColor, Palette.whiteColor],
            secondaryColors: [Palette.secondaryColor, Palette.whiteColor],
            duration: Duration(seconds: 2),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: body),
                  btnContinue,
                  platforms,
                ],
              ),
            ),
          )),
    );
  }

  Widget get body {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        projectTitle,
        SizedBox(height: 30),
        Graphics.animSplash,
      ],
    );
  }

  Widget get projectTitle1 {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: constraints.maxWidth * 0.125,
              width: constraints.maxWidth * 0.125,
              child: Graphics.logo,
            ),
            //'assets/images/logo.png'.toIcon(size: constraints.maxWidth * 0.125),
            SizedBox(width: 15),
            Text(
              context.text('appName'),
              style: TextStyle(
                color: Palette.whiteColor,
                fontSize: constraints.maxWidth * 0.08,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }

  Widget get projectTitle {
    return LayoutBuilder(
      builder: (context, constraints) {
        final logoSize = constraints.maxWidth * 0.125;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/images/knight_logo.png',
              width: logoSize,
              height: logoSize,
            ),
            const SizedBox(width: 10),
            Text(
              'Good Doctor',
              style: GoogleFonts.playball(
                  textStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: constraints.maxWidth * 0.08,
                  ),
                  shadows: [
                    const Shadow(
                      color: Colors.white,
                      blurRadius: 5,
                      offset: Offset(1, 5),
                    )
                  ]),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }

  Widget get platforms {
    return LayoutBuilder(
      builder: (context, constraints) {
        final iconSize = constraints.maxWidth * 0.1;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.text('availableOn'),
              style: TextStyle(
                color: Palette.blackColor,
                fontSize: constraints.maxWidth * 0.03,
              ),
              textAlign: TextAlign.start,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.android, size: iconSize, color: Palette.blackColor),
                Icon(Icons.apple, size: iconSize, color: Palette.blackColor),
              ],
            ),
            SizedBox(height: 30)
          ],
        );
      },
    );
  }

  Widget get btnContinue {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(30, 30, 30, 15),
      child: TextButton(
          onPressed: () {},
          child: Text(
            context.text('continue'),
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
