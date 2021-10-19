import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_car_test/data/template_data.dart';

class BrowseAllContent extends StatelessWidget {
  const BrowseAllContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: TemplateData.data.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Image.asset(
        TemplateData.data[index],
        fit: BoxFit.fill,
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      mainAxisSpacing: 9.0,
      crossAxisSpacing: 9.0,
    );
  }
}
