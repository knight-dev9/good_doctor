import '../../exporter.dart';

class Themes {
  static TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return Palette.greyColor;
              }
              return Palette.blackColor;
            },
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          enableFeedback: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          foregroundColor: WidgetStatePropertyAll(Palette.whiteColor),
          overlayColor: WidgetStatePropertyAll(Colors.white.withOpacity(0.25)),
          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 22,
          ))),
    );
  }

  static OutlinedButtonThemeData get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          shape: WidgetStateProperty.all(StadiumBorder()),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return Palette.greyColor;
              }
              return Palette.primaryColor;
            },
          ),
          side: WidgetStateBorderSide.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return BorderSide(color: Palette.greyColor);
              }
              return BorderSide(color: Palette.primaryColor);
            },
          ),
          overlayColor: WidgetStatePropertyAll(
            Palette.primaryColor.withOpacity(0.25),
          ),
          padding: WidgetStatePropertyAll(EdgeInsets.all(16))),
    );
  }

  static AppBarTheme get appBarTheme {
    return const AppBarTheme(
      color: Colors.transparent,
      titleSpacing: 0, // NavigationToolbar.kMiddleSpacing
      centerTitle: false,
    );
  }

  static TextSelectionThemeData get textSelectionTheme {
    return TextSelectionThemeData(
      cursorColor: Palette.primaryColor,
      selectionHandleColor: Palette.primaryColor,
      selectionColor: Palette.primaryColor.withOpacity(0.25),
    );
  }

  static ProgressIndicatorThemeData get circularIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: Colors.white,
      refreshBackgroundColor: Colors.transparent,
      linearTrackColor: Colors.transparent,
      circularTrackColor: Colors.transparent,
    );
  }

  static NavigationBarThemeData get navigationBarTheme {
    return NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateTextStyle.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(color: Palette.primaryColor, fontSize: 12);
            }
            return TextStyle(color: Palette.greyColor, fontSize: 12);
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: Palette.primaryColor);
            }
            return IconThemeData(color: Palette.greyColor);
          },
        ));
  }

  static TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelStyle: TextStyle(color: Palette.primaryColor, fontSize: 12),
      unselectedLabelStyle: TextStyle(
        color: Palette.greyDarkColor,
        fontSize: 12,
      ),
      dividerHeight: 0,
      indicatorColor: Colors.transparent,
    );
  }

  static FloatingActionButtonThemeData get floatingActionButtonTheme {
    return FloatingActionButtonThemeData(
      backgroundColor: Palette.secondaryColor,
      shape: CircleBorder(),
    );
  }

  static SnackBarThemeData get snackBarTheme {
    return SnackBarThemeData(
      backgroundColor: Palette.blackColor,
    );
  }
}
