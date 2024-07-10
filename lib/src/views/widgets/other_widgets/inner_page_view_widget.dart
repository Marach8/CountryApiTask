import 'package:country_api_task/src/riverpod_state_management/providers/inner_page_view_index_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/inner_page_controller_provider.dart';
import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/country_flag_display_widget.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallTaskInnerPageViewWidget extends StatelessWidget {
  final List<String> listOfCoatOfArmsAndMapsUrl;
  final String countryName;

  const AgroMallTaskInnerPageViewWidget({
    super.key,
    required this.listOfCoatOfArmsAndMapsUrl,
    required this.countryName
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Consumer(
        builder: (_, ref, __) {
          final controller = ref.watch(innerPageControllerProvider);
      
          return PageView(
            controller: controller,
            //takes the current page index from the inner pageview and writes it to the 
            //the innerPageIndexProvider of that particular country identified by its name
            onPageChanged: (index) => ref.read(innerPageIndexProvider(countryName).notifier).state = index,
            children: listOfCoatOfArmsAndMapsUrl.map(
              (url){
                final imageFileExtension = url.split(AgroMallTaskStrings.dotString).last;

                //Checks to ensure that a valid image url is fed into the widget that will load it.
                if(imageFileExtension == AgroMallTaskStrings.svg){
                  return AgroMallTaskCountryFlagDisplayWidget(
                    flagUrl: url,
                    fit: BoxFit.cover,
                  );
                }
                else if(url == AgroMallTaskStrings.dataNotAvailable){
                  return Center(
                    child: Text(
                      url,
                      maxLines: null,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AgroMallTaskColors.warningColor,
                        fontWeight: AgroMallTaskFontWeights.bold
                      ),
                    ),
                  );
                }
                else {
                  return Image.network(
                    url,  
                    alignment: Alignment.center,
                    loadingBuilder: (_, __, ___) => ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(8),
                      child: const AgroMallTaskShimmerWidget()
                    ),
                    errorBuilder: (_, __, ___) => Center(
                      child: Text(
                        AgroMallTaskStrings.couldNotLoadImage,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AgroMallTaskColors.warningColor,
                          fontWeight: AgroMallTaskFontWeights.heavy
                        ),
                      )
                    ),
                  );
                }
              }
            ).toList(),
          );
        }
      ),
    );
  }
}