import 'package:flutter/cupertino.dart';

double mediaHeight(BuildContext context, double scale) =>
    MediaQuery.of(context).size.height * scale;

double mediaWidth(BuildContext context, double scale) =>
    MediaQuery.of(context).size.width * scale;
