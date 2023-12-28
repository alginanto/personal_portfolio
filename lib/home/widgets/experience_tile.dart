import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/appcolors.dart';
import 'package:personal_portfolio/utils/extensions.dart';

class ExpCard extends StatefulWidget {
  final Map details;
  const ExpCard({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  State<ExpCard> createState() => _ExpCardState();
}

class _ExpCardState extends State<ExpCard> {
  Color normalColor = Colors.transparent;

  Color hoverColor = AppColors.cardHoverColor;

  bool hover = false;

  late Color current;
  @override
  void initState() {
    current = normalColor;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          current = hoverColor;
          hover = true;
        });
      },
      onExit: (event) {
        setState(() {
          current = normalColor;
          hover = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: current,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${widget.details["start"]} - ${widget.details["end"]}",
                    style: context.bodyM.col(Colors.white54),
                  ),
                ],
              ),
            ),
            10.wBox,
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.details["title"]} · ${widget.details["company"]}",
                    style: context.bodyM
                        .col(hover ? AppColors.companyTitleColor : Colors.white)
                        .w600,
                  ),
                  20.hBox,
                  Text(
                    "${widget.details["description"]}",
                    style: context.bodyS.copyWith(
                        height: 1.5, color: Colors.white54, fontSize: 14),
                  ),
                  20.hBox,
                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: (widget.details["skills"] as List<String>)
                        .map((e) => CustomChip(text: e))
                        .toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9999),
        color: AppColors.cardHoverColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.0),
            offset: Offset(0, 0),
            blurRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Text(
        text,
        style: context.bodyS
            .col(
              AppColors.companyTitleColor,
            )
            .w500,
      ),
    );
  }
}
