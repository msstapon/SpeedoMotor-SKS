import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.size.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';

class LoadingWidget extends StatelessWidget {
  showLoadingDialogs(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return createLoadingDialog(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.colorPrimaryDark,
        body: createLoadingDialog(context)
    );
  }

  Widget createLoadingDialog(BuildContext context) {
    AppSizeConfig appSizeConfig = new AppSizeConfig(context);
    return Container(
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children:
              [
                CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppTheme.colorPrimaryDark)),
                Container(
                    margin: EdgeInsets.only(left: 0, top: 20),
                    child: Text("Loading",
                        style: TextStyle(
                            fontSize: Theme.of(context).textTheme.bodyText2.fontSize ,
                            color: AppTheme.colorPrimaryDark)
                    )
                ),
              ]
          )
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
