import 'package:vector_tile_renderer/src/themes/expression/expression.dart';
import 'package:vector_tile_renderer/src/themes/expression/parser/expression_parser.dart';
import 'package:vector_tile_renderer/src/themes/expression/zoom_expression.dart';

class ZoomExpressionParser extends ExpressionComponentParser {
  ZoomExpressionParser(ExpressionParser parser) : super(parser, 'zoom');

  @override
  bool matches(List<dynamic> json) => super.matches(json) && json.length == 1;

  @override
  Expression? parse(List<dynamic> json) => ZoomExpression();
}
