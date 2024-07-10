import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/outer_page_view_index_provider.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/annotated_region.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/home_indicator_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/full_country_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class AgroMallTaskFullCountryDetailScreen extends StatefulWidget {
  final int indexOfTappedCountry;

  const AgroMallTaskFullCountryDetailScreen({
    super.key,
    required this.indexOfTappedCountry
  });

  @override
  State<AgroMallTaskFullCountryDetailScreen> createState() => _AgroMallTaskFullCountryDetailScreenState();
}

class _AgroMallTaskFullCountryDetailScreenState extends State<AgroMallTaskFullCountryDetailScreen> {
  late PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: 0);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _pageController.jumpToPage(widget.indexOfTappedCountry)
    );
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AgroMallTaskAnnotatedRegionWidget(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Consumer(
            builder: (_, ref, __) {
              final sortedCountryModels = ref.watch(countriesDataStateProvider.notifier).getSortedListOfCountryModels();
              final currentIndex = ref.watch(outerPageIndexProvider);
              final nameOfCountry = sortedCountryModels.elementAt(currentIndex).name;
              
              return Text(nameOfCountry);
            }
          ),
        ),
      
        body: Consumer(
          builder: (_, ref, __) {
            final sortedCountryModels = ref.watch(countriesDataStateProvider.notifier).getSortedListOfCountryModels();
      
            return PageView.builder(
              controller: _pageController,
              itemCount: sortedCountryModels.length,
              onPageChanged: (index) => ref.read(outerPageIndexProvider.notifier).state = index,
              itemBuilder: (_, pageIndex){
                final countryModel = sortedCountryModels.elementAt(pageIndex);
                return AgroMallTaskFullCountryDetailsWidget(countryModel: countryModel);
              }
            );
          }
        ),
        bottomNavigationBar: const AgroMallTaskHomeIndicatorWidget(),
      ),
    );
  }
}