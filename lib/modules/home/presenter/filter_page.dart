import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mesa_news_challenge/modules/home/presenter/controller/home_controller.dart';
import 'package:mesa_news_challenge/themes/colors_guide_theme.dart';
import 'package:mesa_news_challenge/themes/text_style_guide_theme.dart';
import 'package:mesa_news_challenge/widgets/appbar/appbar_default_widget.dart';
import 'package:mesa_news_challenge/widgets/button/button_switch_widget.dart';
import 'package:intl/intl.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Observer(
      builder: (_) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: MesaAppBarDefaultWidget(
            title: "Filtro",
            prefix: IconButton(
              icon: SvgPicture.asset("assets/back.svg"),
              onPressed: () => Modular.to.pop(),
            ),
            sufix: InkWell(
              child: Text(
                "Limpar",
                style: MesaTextStyleGuide.heading01.copyWith(
                  color: MesaColorsGuide.LINK,
                ),
              ),
              onTap: controller.cleanFilter,
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
                        controller.filterPerDate != null
                            ? DateFormat("dd/MM/yyyy")
                                .format(controller.filterPerDate)
                            : "Todas",
                        textAlign: TextAlign.right,
                        style: MesaTextStyleGuide.heading06
                            .copyWith(fontStyle: FontStyle.italic),
                      ),
                      isThreeLine: true,
                      trailing: SvgPicture.asset("assets/next.svg"),
                      onTap: controller.showDateTimePicker,
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
                    value: controller.isFavorite,
                    onChanged: controller.toogleFavorite,
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
      ),
    );
  }
}
