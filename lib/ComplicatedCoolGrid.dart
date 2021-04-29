import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'Formatting.dart';

class ComplicatedCoolGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: Formatting.backgroundColor,
                child: Column(
                  children: [
                    ResponsiveGridRow(
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
                                height: 100,
                                color: Colors.green))
                      ],
                    ),
                    ResponsiveGridRow(
                      children: [
                        ResponsiveGridCol(
                            sm: 12,
                            child: Container(
                                height: 100,
                                color: Colors.pink)),
                      ],
                    ),
                    ResponsiveGridRow(
                      children: [
                        ResponsiveGridCol(
                            sm: 3,
                            md: 6,
                            child: Container(
                                height: 100,
                                color: Colors.blue)),
                        ResponsiveGridCol(
                            sm: 3,
                            md: 6,
                            child: Container(
                                height: 100,
                                color: Colors.green)),
                        ResponsiveGridCol(
                            sm: 3,
                            md: 6,
                            lg: 12,
                            child: Container(
                                height: 100,
                                color: Colors.green))
                      ],
                    )
                  ],
                ))));
  }
}