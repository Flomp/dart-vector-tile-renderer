import 'package:vector_tile_renderer/vector_tile_renderer.dart';

import 'test_files.dart';
import 'test_logger.dart';

Future<Tile> readTestTile(Theme theme,
    {String filename = 'sample_tile.pbf'}) async {
  final bytes = await readTestFile(filename);
  return TileFactory(theme, testLogger).create(VectorTileReader().read(bytes));
}
