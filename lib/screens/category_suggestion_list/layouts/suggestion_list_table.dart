

import '../../../config.dart';

class SuggestionListTable extends StatelessWidget {
  final List<TableRow>? children;
  const SuggestionListTable({Key? key,this .children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.r6),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          1: FlexColumnWidth(),
          2: IntrinsicColumnWidth(flex: 1),
          3: FlexColumnWidth(),
          4: FlexColumnWidth()
        },
        children: children!,
      ).decorated(
          border: Border.all(color: appCtrl.appTheme.primary),
          borderRadius: BorderRadius.circular(AppRadius.r6)),
    );
  }
}
