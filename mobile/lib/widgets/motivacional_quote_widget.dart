import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitaplus/models/quote_model.dart';
import 'package:vitaplus/utils/colors.dart';

class MotivacionalQuoteWidget extends StatefulWidget {
  const MotivacionalQuoteWidget({super.key, required this.quote});
  final QuoteModel quote;

  @override
  State<MotivacionalQuoteWidget> createState() =>
      _MotivacionalQuoteWidgetState();
}

class _MotivacionalQuoteWidgetState extends State<MotivacionalQuoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.tips_and_updates,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\"${widget.quote.text}\"",
                  style: GoogleFonts.sen(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.quote.author,
                  style: GoogleFonts.sen(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
