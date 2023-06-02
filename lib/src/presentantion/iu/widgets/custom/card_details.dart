import 'package:flutter/material.dart';
// import 'package:sittca/src/app/context/localizations/app_localizations.dart';

class CardDetails extends StatelessWidget {
  final String numberProject;
  final String title;
  final int step;
  final String bottonText;
  final void Function() onViewDetailsPressed;
  CardDetails(
      {Key? key,
      required this.numberProject,
      required this.title,
      required this.step,
      required this.bottonText,
      required this.onViewDetailsPressed})
      : super(key: key);
  // AppLocalizations l10n = AppLocalizations();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.45,
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      numberProject,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: Text(
                      "l10n.viewDetails",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      onViewDetailsPressed();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * 0.8,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 100,
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: step == 6
                                ? Colors.grey
                                : step == 5
                                    ? Colors.red
                                    : step > 0
                                        ? Colors.green
                                        : Colors.grey),
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(2)),
                    const Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    )),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: step == 6
                                ? const Color.fromARGB(227, 204, 202, 202)
                                : step == 5
                                    ? Colors.red
                                    : step > 1
                                        ? Colors.green
                                        : Colors.grey),
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(2)),
                    const Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    )),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: step == 6
                                ? const Color.fromARGB(227, 204, 202, 202)
                                : step == 5
                                    ? Colors.red
                                    : step > 2
                                        ? Colors.green
                                        : Colors.grey),
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(2)),
                    const Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    )),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: step == 6
                                ? const Color.fromARGB(227, 204, 202, 202)
                                : step == 5
                                    ? Colors.red
                                    : step > 3
                                        ? Colors.green
                                        : Colors.grey),
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(2)),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                bottonText,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
