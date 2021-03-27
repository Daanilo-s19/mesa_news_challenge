import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesa_news_challenge/modules/home/presenter/controller/home_controller.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/appbar/appbar_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/button_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/button_switch_widget.dart';
import 'package:intl/intl.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final controller = Modular.get<HomeController>();
  bool toogle;
  DateTime date;
  @override
  void initState() {
    super.initState();
    toogle = controller.isFavorite;
    date = controller.filterPerDate;
  }

  void _setToogle(value) {
    setState(() {
      toogle = value;
    });
  }

  showDateTimePicker() async {
    final result = await showDatePicker(
      context: context,
      initialDate: controller.filterPerDate ?? DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: DateTime.now(),
    );
    setState(() {
      date = result;
    });
  }

  _setCleanFilter() {
    setState(() {
      toogle = false;
      date = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: MesaAppBarDefaultWidget(
          title: "Filtro",
          prefix: IconButton(
            icon: SvgPicture.asset("assets/back.svg"),
            onPressed: () => Modular.to.pop(),
          ),
          sufix: IconButton(
            padding: EdgeInsets.zero,
            icon: Text(
              "Limpar",
              style: MesaTextStyleGuide.heading02.copyWith(
                color: MesaColorsGuide.LINK,
              ),
            ),
            onPressed: _setCleanFilter,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Data",
                    style: MesaTextStyleGuide.heading06,
                  ),
                ),
                Container(
                  width: 200,
                  height: 44,
                  child: ListTile(
                    subtitle: Text(""),
                    title: Text(
                      date != null
                          ? DateFormat("dd/MM/yyyy").format(date)
                          : "Todas",
                      textAlign: TextAlign.right,
                      style: MesaTextStyleGuide.heading06
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                    isThreeLine: true,
                    trailing: SvgPicture.asset("assets/next.svg"),
                    onTap: () => showDateTimePicker(),
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Apenas Favoritos",
                    style: MesaTextStyleGuide.heading06,
                  ),
                ),
                MesaSwitchButtonWidget(
                  value: toogle,
                  onChanged: _setToogle,
                ),
              ],
            ),
            Divider(
              height: 1,
              color: Colors.black,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: MesaColorsGuide.PRIMARY,
        child: MesaButtonDefaultWidget(
          text: "Filtrar",
          onPressed: () {
            controller.setFilterNews(fav: toogle, dateTime: date);
            Modular.to.pop();
          },
        ),
      ),
    );
  }
}
