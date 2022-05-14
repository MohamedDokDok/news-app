import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

import '../modules/web_view/web_view_screen.dart';


Widget buildArticlesItem(dynamic articles, context)=>  InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(articles['url']));
  },
  child:   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                  '${articles['urlToImage']}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${articles['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${articles['publishedAt']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
);

Widget divider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    height: .5,
    color: Colors.grey[700],
  ),
);

Widget articleBuilder(listArticle, context, {isSearch = false}) => Conditional.single(
  conditionBuilder: (context) =>  listArticle.length > 0,
  widgetBuilder: (context) {
    return  ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticlesItem(listArticle[index], context),
      separatorBuilder: (context, index) => divider(),
      itemCount: listArticle.length,
    );
  } ,
  fallbackBuilder: (context) => isSearch ? Container() : const Center(child: CircularProgressIndicator()),
  context: context,
);

Widget defaultTextFormFiled ({
  @required TextEditingController? controller,
  TextInputType? boardType,
  bool isObscure = false,
  @required String? label,
  @required IconData? prefixICon,
  IconData? suffixIcon,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  @required FormFieldValidator<String>? validate,
  VoidCallback? suffixPress,
  GestureTapCallback? onTap,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: boardType,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        prefixIcon: Icon(
            prefixICon
        ),
        suffixIcon: suffixIcon != null ? IconButton(
          icon: Icon(suffixIcon), onPressed: suffixPress,) : null,
      ),
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      onTap: onTap,
    );


void navigateTo(context, widget) => Navigator.push(context,
  MaterialPageRoute(
      builder: (context) => widget,
  ),
);