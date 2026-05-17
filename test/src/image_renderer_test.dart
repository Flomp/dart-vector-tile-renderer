import 'package:test/test.dart';
import 'package:vector_tile_renderer/vector_tile_renderer.dart';

import 'test_files.dart';
import 'test_logger.dart';
import 'test_tile.dart';

void main() {
  Future<void> assertImageWith(Tile tile, Theme theme, String provider,
      {required double zoom}) async {
    final renderer = ImageRenderer(theme: theme, scale: 4, logger: testLogger);
    final image = await renderer.render(
        TileSource(tileset: Tileset({provider: tile})),
        zoomScaleFactor: 4,
        zoom: zoom);
    final imageBytes = await image.toPng();
    final file = await writeTestFile(imageBytes, 'rendered-tile-zoom$zoom.png');
    final stat = await file.stat();
    expect(image.width, 1024);
    expect(image.height, 1024);
    expect(stat.size, isNonZero);
  }

  test('renders a vector tile', () async {
    final theme = ProvidedThemes.lightTheme();
    final tile =
        await readTestTile(ProvidedThemes.lightTheme(logger: testLogger));
    await assertImageWith(tile, theme, 'openmaptiles', zoom: 6);
    await assertImageWith(tile, theme, 'openmaptiles', zoom: 13);
    await assertImageWith(tile, theme, 'openmaptiles', zoom: 15);
    await assertImageWith(tile, theme, 'openmaptiles', zoom: 18);
  });

  test('renders a pmtile vector tile', () async {
    final theme = ProvidedThemes.protomapsLight();
    final tile = await readTestTile(theme, filename: 'sample_tile.mvt');
    await assertImageWith(tile, theme, 'protomaps', zoom: 6);
    await assertImageWith(tile, theme, 'protomaps', zoom: 13);
    await assertImageWith(tile, theme, 'protomaps', zoom: 15);
    await assertImageWith(tile, theme, 'protomaps', zoom: 18);
  });
}
