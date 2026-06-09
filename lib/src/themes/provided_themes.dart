import 'package:vector_tile_renderer/src/themes/wanderer/wanderer_light_theme.dart';

import '../logger.dart';
import 'theme.dart';
import 'theme_reader.dart';

class ProvidedThemes {
  ProvidedThemes._();

  static Theme wandererLight({Logger? logger}) =>
      ThemeReader(logger: logger).read(wandererLightTheme());

  static Theme wandererDark({Logger? logger}) =>
      ThemeReader(logger: logger).read(wandererLightTheme());
}
