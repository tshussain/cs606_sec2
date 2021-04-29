import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'Formatting.dart';

class CoolGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: Formatting.backgroundColor,
                child: ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                        sm: 6,
                        md: 8,
                        lg: 4,
                        child: Container(
                            height: 100,
                            color: Colors.blue)),
                    ResponsiveGridCol(
                        sm: 6,
                        md: 4,
                        lg: 8,
                        child: Container(
                            height: 200,
                            color: Colors.green))
                  ],
                ))));
  }
}
