import 'package:flutter/cupertino.dart';

class pastry_list_view_seperated extends StatelessWidget {
  const pastry_list_view_seperated({
    super.key, required this.itemCount, required this.itemBuilder,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(separatorBuilder: (context, index)=> const SizedBox(height: 10,),
        itemCount: itemCount,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,

        physics: const NeverScrollableScrollPhysics(),

        itemBuilder: itemBuilder
    );
  }
}
