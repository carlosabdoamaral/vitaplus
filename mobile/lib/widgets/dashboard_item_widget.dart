import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardItemWidget extends StatefulWidget {
  const DashboardItemWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.background,
    required this.foreground,
    required this.margin,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color background;
  final Color foreground;
  final EdgeInsets margin;
  final Function onTap;

  @override
  State<DashboardItemWidget> createState() => _DashboardItemWidgetState();
}

class _DashboardItemWidgetState extends State<DashboardItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          margin: widget.margin,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.background,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.foreground,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: GoogleFonts.sen(
                        color: widget.foreground,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      widget.value,
                      style: GoogleFonts.sen(
                          color: widget.foreground,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
