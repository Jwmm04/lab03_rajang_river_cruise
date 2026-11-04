
import 'package:flutter/material.dart';

import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  void _showMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$action button pressed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, child) {
        final destination = viewModel.destination;

        final imageSection = HeaderImageWidget(
          imagePath: destination.imagePath,
        );

        final titleSection = TitleSection(
          name: destination.name,
          location: destination.location,
          starCount: viewModel.starCount,
          onStarPressed: viewModel.incrementStarCount,
        );

        final buttonSection = ButtonSection(
          onCall: () => _showMessage(context, 'CALL'),
          onRoute: () => _showMessage(context, 'ROUTE'),
          onShare: () => _showMessage(context, 'SHARE'),
        );

        final descriptionSection = DescriptionWidget(
          description: destination.description,
        );

        final bookingSection = BookingControlsWidget(
          selectedDate: viewModel.selectedDate,
          selectedPackage: viewModel.selectedPackage,
          packages: viewModel.packages,
          isDarkMode: viewModel.isDarkMode,
          onDateSelected: viewModel.setVisitDate,
          onPackageSelected: viewModel.setPackage,
          onThemeChanged: viewModel.toggleTheme,
        );

        return Scaffold(
          appBar: AppBar(
            title: const Text('Rajang River Cruise'),
            centerTitle: true,
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isLandscape = constraints.maxWidth >= 650;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: isLandscape
                      ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            imageSection,
                            titleSection,
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            buttonSection,
                            descriptionSection,
                            bookingSection,
                          ],
                        ),
                      ),
                    ],
                  )
                      : Column(
                    children: [
                      imageSection,
                      titleSection,
                      buttonSection,
                      descriptionSection,
                      bookingSection,
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}