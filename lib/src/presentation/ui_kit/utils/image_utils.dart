import 'package:billionaire/core/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageUtils {
  static void svgPrecacheImage() {
    final cacheSvgImages = Assets.icons.values
        .map((e) => e.path)
        .toList();

    for (final String element in cacheSvgImages) {
      final loader = SvgAssetLoader(element);
      svg.cache.putIfAbsent(
        loader.cacheKey(null),
        () => loader.loadBytes(null),
      );
    }
  }
}
