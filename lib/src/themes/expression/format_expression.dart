import 'package:vector_tile_renderer/src/themes/expression/expression.dart';

class FormatExpression extends Expression<String> {
  final List<Expression> _parts;

  FormatExpression(this._parts)
      : super(
          'format',
          _parts.expand((p) => p.properties()).cast<String>().toSet(),
        );

  @override
  String? evaluate(EvaluationContext context) {
    final buffer = StringBuffer();
    for (final part in _parts) {
      final value = part.evaluate(context);
      if (value != null) {
        buffer.write(value.toString());
      }
    }
    final result = buffer.toString().trim();
    return result.isEmpty ? null : result;
  }

  @override
  bool get isConstant => _parts.every((part) => part.isConstant);
}
