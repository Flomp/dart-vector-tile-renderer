import 'package:vector_tile_renderer/src/themes/expression/format_expression.dart';

import '../expression.dart';
import '../literal_expression.dart';
import 'expression_parser.dart';

class FormatExpressionParser extends ExpressionComponentParser {
  FormatExpressionParser(ExpressionParser parser) : super(parser, 'format');

  @override
  bool matches(List<dynamic> json) => json.isNotEmpty && json[0] == 'format';

  @override
  Expression? parse(List<dynamic> json) {
    final parts = <Expression>[];

    for (var i = 1; i < json.length; i += 2) {
      final segment = json[i];

      if (segment == '\n') {
        parts.add(LiteralExpression(' '));
        continue;
      }

      final expr = parser.parseOptional(segment);
      if (expr != null) {
        parts.add(expr);
      }
    }

    return FormatExpression(parts);
  }
}
