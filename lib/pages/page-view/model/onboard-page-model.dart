import 'dart:ui';

class OnboardPageModel {
  final int pageNumber;

  final Color primeColor;
  final Color accentColor;
  final Color nextAccentColor;

  final String subhead;
  final String caption;
  final String imagePath;
  final String description;

  OnboardPageModel(
      this.primeColor,
      this.accentColor,
      this.nextAccentColor,
      this.pageNumber,
      this.imagePath,
      this.caption,
      this.subhead,
      this.description);
}
