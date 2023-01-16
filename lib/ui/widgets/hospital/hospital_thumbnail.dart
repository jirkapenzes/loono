import 'package:flutter/material.dart';
import 'package:loono/constants.dart';
import 'package:loono/models/hospital.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalThumbnailView extends StatelessWidget {
  const HospitalThumbnailView({
    super.key,
    required this.hospital,
    required this.onFavoritesAddTap,
    required this.onFavoritesRemoveTap,
    this.isFavorites = false,
  });

  final Hospital hospital;
  final bool isFavorites;
  final Function(Hospital) onFavoritesAddTap;
  final Function(Hospital) onFavoritesRemoveTap;

  Future<void> _openHospitalWeb(Uri? hospitalUri) async {
    if (hospitalUri == null) {
      return;
    }

    if (await canLaunchUrl(hospitalUri)) {
      await launchUrl(hospitalUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hospitalUri = Uri.tryParse(hospital.web);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            LoonoColors.greenLight,
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _openHospitalWeb(hospitalUri),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hospitalUri != null)
                    Text(
                      hospitalUri.host.toUpperCase(),
                      style: LoonoFonts.cardSubtitle.copyWith(color: LoonoColors.grey),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    hospital.name,
                    style: LoonoFonts.cardTitle.copyWith(color: LoonoColors.secondaryFont),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hospital.address,
                    style: LoonoFonts.cardAddress,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: isFavorites ? () => onFavoritesRemoveTap(hospital) : () => onFavoritesAddTap(hospital),
            child: isFavorites
                ? const Icon(Icons.favorite, color: LoonoColors.redButton)
                : const Icon(Icons.favorite_border, color: LoonoColors.redButton),
          )
        ],
      ),
    );
  }
}
