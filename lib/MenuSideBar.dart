import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'Formatting.dart';

class MenuSideBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
                    color: Formatting.backgroundColor,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                      ResponsiveGridRow(
                        children: [
                          ResponsiveGridCol(
                              sm: 12,
                              md: 6,
                              lg: 3,
                              child: TextButton(
                                  onPressed: () {}, child: Text("Choice 1"))),
                          ResponsiveGridCol(
                              sm: 12,
                              md: 6,
                              lg: 3,
                              child: TextButton(
                                  onPressed: () {}, child: Text("Choice 2"))),
                          ResponsiveGridCol(
                              sm: 12,
                              md: 6,
                              lg: 3,
                              child: TextButton(
                                  onPressed: () {}, child: Text("Choice 3"))),
                          ResponsiveGridCol(
                              sm: 12,
                              md: 6,
                              lg: 3,
                              child: TextButton(
                                  onPressed: () {}, child: Text("Choice 4"))),
                        ],
                      ),
                    ]));
  }
}
