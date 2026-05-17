import 'package:vector_tile_renderer/src/themes/expression/expression.dart';

class ZoomExpression extends Expression<double> {
  ZoomExpression() : super('zoom', {});

  @override
  double? evaluate(EvaluationContext context) => context.zoom;

  @override
  bool get isConstant => false;
}
