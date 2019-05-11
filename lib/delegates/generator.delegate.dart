import 'package:flutter/material.dart';

typedef TResult GeneratorWNP<TResult>(BuildContext context);

typedef TResult GeneratorW1P<TParam1, TResult>(BuildContext context, TParam1 p1);

typedef TResult GeneratorW2P<TParam1, TParam2, TResult>(BuildContext context, TParam1 p1, TParam2 p2);

typedef TResult GeneratorW3P<TParam1, TParam2, TParam3, TResult>(BuildContext context, TParam1 p1, TParam2 p2, TParam3 p3);

typedef TResult GeneratorW4P<TParam1, TParam2, TParam3, TParam4, TResult>(BuildContext context, TParam1 p1, TParam2 p2, TParam3 p3, TParam4 p4);

typedef TResult GeneratorW5P<TParam1, TParam2, TParam3, TParam4, TParam5, TResult>(BuildContext context, TParam1 p1, TParam2 p2, TParam3 p3, TParam4 p4, TParam5 p5);