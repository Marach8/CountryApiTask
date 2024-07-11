import 'package:country_api_task/src/views/widgets/custom_widgets/annotated_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createWidgetForTesting({required Widget testWidget}){
  return ProviderScope(
    child: MaterialApp(
      home: testWidget,
    ),
  );
}
void main(){
  Widget? testWidget;

  setUp((){
    testWidget = createWidgetForTesting(testWidget: const AgroMallTaskAnnotatedRegionWidget(child: SizedBox()));
  });
  group(
    'testing widgets in the homescreen',
    (){
      testWidgets(
        'renders the annotated region widget',
        (tester) async{
          await tester.pumpWidget(testWidget!);
          expect(find.byType(AgroMallTaskAnnotatedRegionWidget), findsOneWidget);
        }
      );
    }
  );
}
