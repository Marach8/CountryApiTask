import 'package:country_api_task/src/models/country_data_model.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/country_flag_display_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/inner_page_indicator_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/inner_page_view_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/row_of_next_and_previous_page_buttons.dart';
import 'package:flutter/material.dart';

class AgroMallTaskFullCountryDetailsAnimatedStack extends StatefulWidget {
  final AgroMallTaskCountryModel countryModel;
  final List<String> listOfCoatOfArmsAndMapsUrl;
  
  const AgroMallTaskFullCountryDetailsAnimatedStack({
    super.key,
    required this.countryModel,
    required this.listOfCoatOfArmsAndMapsUrl
  });

  @override
  State<AgroMallTaskFullCountryDetailsAnimatedStack> createState() => _AgroMallTaskFullCountryDetailsAnimatedStackState();
}

class _AgroMallTaskFullCountryDetailsAnimatedStackState extends State<AgroMallTaskFullCountryDetailsAnimatedStack> 
with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _heightAnimation, _widthAnimation;

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _heightAnimation = Tween<double>(begin: 0.0, end: 200).animate(_animationController);
    _widthAnimation = Tween<double>(begin: 0.0, end: double.infinity).animate(_animationController);

    _animationController.forward();
  }

  @override 
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _heightAnimation,
      builder: (_, __) {
        return SizedBox(
          height: _heightAnimation.value,
          width: _widthAnimation.value,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.hardEdge,
            children: [
              Center(
                child: AgroMallTaskCountryFlagDisplayWidget(
                  flagUrl: widget.countryModel.flag,
                  height: _heightAnimation.value,
                  width: _widthAnimation.value,
                  fit: BoxFit.cover,
                )
              ),
              
              Center(
                child: AgroMallTaskInnerPageViewWidget(
                  listOfCoatOfArmsAndMapsUrl: widget.listOfCoatOfArmsAndMapsUrl,
                  countryName: widget.countryModel.name
                ),
              ),
        
              Center(child: AgroMallRowWithTwoCircularButtonsWidget(country: widget.countryModel.name)),
        
              const Positioned(
                bottom: 20,
                child: AgroMallTaskInnerPageIndicatorWidget()
              )
            ],
          ),
        );
      }
    );
  }
}