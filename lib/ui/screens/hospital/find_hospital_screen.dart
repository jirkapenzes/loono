import 'package:flutter/material.dart';
import 'package:loono/constants.dart';
import 'package:loono/l10n/ext.dart';
import 'package:loono/models/hospital.dart';
import 'package:loono/services/hospital_service.dart';
import 'package:loono/ui/widgets/hospital/hospital_thumbnail.dart';
import 'package:provider/provider.dart';

class FindHospitalScreen extends StatefulWidget {
  const FindHospitalScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FindHospitalPage();
}

class _FindHospitalPage extends State<FindHospitalScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HospitalService>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<HospitalService>().isLoading;
    final hospitals = context.watch<HospitalService>().hospitals;
    final favorites = context.watch<HospitalService>().favorites;

    return Scaffold(
      backgroundColor: LoonoColors.primaryLight,
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              indicatorColor: LoonoColors.primary,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(context.l10n.main_menu_item_find_hospital_tab1_all, style: LoonoFonts.tabTitle),
                ),
                Tab(
                  child: Text(
                    context.l10n.main_menu_item_find_hospital_tab2_favorites(favorites.length),
                    style: LoonoFonts.tabTitle,
                  ),
                )
              ],
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: LoonoColors.primary),
                    )
                  : Container(
                      padding: const EdgeInsets.all(16),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _renderList(hospitals),
                          _renderList(favorites),
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderList(List<Hospital> hospitals) {
    if (hospitals.isEmpty) {
      return Center(
        child: Text(context.l10n.main_menu_item_find_hospital_empty_list),
      );
    }

    return ListView.builder(
      itemCount: hospitals.length,
      itemBuilder: (context, index) => HospitalThumbnailView(
        hospital: hospitals[index],
        isFavorites: context.read<HospitalService>().favorites.contains(hospitals[index]),
        onFavoritesAddTap: context.read<HospitalService>().addToFavorites,
        onFavoritesRemoveTap: context.read<HospitalService>().removeFromFavorites,
      ),
    );
  }
}
