import 'dart:math' as math;
import 'package:flutter/material.dart';

class AlertPanel extends StatelessWidget {
  final VoidCallback onClose;
  final Function(String alertType)? onAlertSelected;
  const AlertPanel({super.key, required this.onClose, this.onAlertSelected});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> alertTypes = [
      {
        'type': 'accident',
        'icon': 'assets/markers/car-crash.gif',
        'label': 'Accident',
      },
      {
        'type': 'fire',
        'icon': 'assets/markers/fire.gif',
        'label': 'Fire Alert',
      },
      {'type': 'fight', 'icon': 'assets/markers/fight.gif', 'label': 'Fight'},
      {'type': 'knife', 'icon': 'assets/markers/knife.gif', 'label': 'Knife'},
      {'type': 'gun', 'icon': 'assets/markers/gun.gif', 'label': 'Gun'},
      {
        'type': 'medical',
        'icon': 'assets/markers/medicine.gif',
        'label': 'Medical',
      },
      {
        'type': 'protest',
        'icon': 'assets/markers/protesters.gif',
        'label': 'Protest',
      },
    ];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            padding: const EdgeInsets.all(12),
            width: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Send Alerts",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                ),
                const SizedBox(height: 12),
                Text(
                  "Tap to instantly alert to the community",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Only raise genuine alerts. False or misleading reports may lead to account suspension.",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 10,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: alertTypes.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, i) {
                    final item = alertTypes[i];
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          onAlertSelected?.call(item['type']!);
                          onClose();
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                item['icon']!,
                                width: 28,
                                height: 28,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item['label']!,
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        // Pointer arrow
        Positioned(
          left: 40,
          bottom: 14,
          child: Transform.rotate(
            angle: math.pi / 4, // 45 degrees
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
