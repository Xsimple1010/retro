import 'package:flutter/material.dart';

class AddArtsPage extends StatefulWidget {
  const AddArtsPage({
    super.key,
  });

  @override
  State<AddArtsPage> createState() => _AddArtsPageState();
}

class _AddArtsPageState extends State<AddArtsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar infamações")),
      body: LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: 280 + constraints.maxWidth * .03,
              height: constraints.maxHeight,
              child: ListView(
                children: [
                  // FutureBuilder(
                  //   future: roms,
                  //   builder: (context, snapshot) => ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: snapshot.data?.length,
                  //     itemBuilder: (context, index) => SettingsOption(
                  //       icon: Icons.abc,
                  //       title: snapshot.data?[index].name ?? "Arquivo invalido",
                  //       onTab: () => {
                  //         setState(() {
                  //           selectedIndex = index;
                  //         })
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: constraints.maxWidth - (280 + constraints.maxWidth * .03),
              child: const Column(
                children: [
                  SizedBox(
                    child: Stack(
                      children: [],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
