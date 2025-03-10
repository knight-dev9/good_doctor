import '../exporter.dart';

class Graphics {
  static const _imageFolder = 'assets/images/';
  static const _animationFolder = 'assets/animations/';

  static var animSplash =
      LottieBuilder.asset('${_animationFolder}doctor_tasks.json');

  static Image logo = '${_imageFolder}logo.png'.toIcon(size: 50);
}
