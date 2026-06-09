import 'package:test/test.dart';
import 'package:vector_tile_renderer/src/logger.dart';
import 'package:vector_tile_renderer/src/themes/provided_themes.dart';

void main() {
  // test('provides a light theme', () {
  //   final theme = ProvidedThemes.lightTheme();
  //   expect(theme.id, 'osm-liberty');
  //   expect(theme.version, '2021-08-22');
  //   expect(theme.tileSources,
  //       <String>{'openmaptiles', 'natural_earth_shaded_relief'});
  // });
  test('provides a wanderer light theme', () {
    final logger = WarningCapturingLogger();
    ProvidedThemes.wandererLight(logger: logger);
    expect(logger.warnings, isEmpty);
  });

  test('provides a wanderer dark theme', () {
    final logger = WarningCapturingLogger();
    ProvidedThemes.wandererDark(logger: logger);
    expect(logger.warnings, isEmpty);
  });
}

class WarningCapturingLogger implements Logger {
  final List<String> warnings = [];

  @override
  void log(MessageFunction message) {}

  @override
  void warn(MessageFunction message) => warnings.add(message());
}
