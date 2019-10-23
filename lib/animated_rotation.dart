library animated_rotation;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' show pi;

/// Animated version of [Transform.rotate] which automatically transitions the
/// rotation over time.
class AnimatedTransform extends ImplicitlyAnimatedWidget {
  /// Creates a widget that rotates its child by a value that animates
  /// implicitly.
  ///
  /// The [angle], [curve], and [duration] arguments must not be null.
  AnimatedTransform({
    Key key,
    @required this.angle,
    this.child,
    Curve curve = Curves.linear,
    Duration duration = const Duration(seconds: 1),
  })  : assert(angle != null),
        super(key: key, curve: curve, duration: duration);

  /// The amount degrees to rotate the child clockwise.
  final double angle;

  /// The widget to rotate
  final Widget child;

  @override
  _AnimatedTransformState createState() => _AnimatedTransformState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<double>('angle', angle));
  }
}

class _AnimatedTransformState
    extends AnimatedWidgetBaseState<AnimatedTransform> {
  Tween<double> _angle;

  num _degToRad(num deg) => deg * (pi / 180.0);

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _angle = visitor(
        _angle, widget.angle, (dynamic value) => Tween<double>(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _degToRad(_angle.evaluate(animation)),
      child: widget.child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Tween<double>>('angle', _angle,
        defaultValue: null));
  }
}
