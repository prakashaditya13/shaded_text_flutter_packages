library shaded_text;

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

typedef ShapeBuilder = Widget Function(BuildContext context, String text,Color color);

class ShadedText extends StatelessWidget{
  final ShapeBuilder shapeBuilder;
  final String text;
  final Color shadeColor;
  final Color textColor;

  ShadedText(
      {@required this.shapeBuilder,
        @required this.text,
        @required this.shadeColor,
        @required this.textColor}): assert(shapeBuilder!=null),
                                    assert(text!=null),
                                    assert(shadeColor!=null),
                                    assert(textColor!=null);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Transform(
            child: shapeBuilder(context,text,shadeColor),
          transform: Matrix4.translationValues(5.0, 5.0, 0.0),
             ),
        shapeBuilder(context,text,textColor),
      ],
    );
  }

}
