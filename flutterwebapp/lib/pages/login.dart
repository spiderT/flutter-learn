import 'package:flutter/material.dart';
import '../widget/loadding.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  // 控制器
  final _unameController = TextEditingController();
  final _pwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // 焦点
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();

  bool isEye = true;
  bool isBtnEnabled = false;
  bool showLoading = false;
  final _unameExp = RegExp(r'^(?![0-9]+$)(?![a-z]+$)[0-9a-z]{6,12}$'); //用户名正则
  final _pwdExp = RegExp(r'^(?![0-9]+$)(?![a-z]+$)[0-9a-z]{6,12}$'); //密码正则

  // 登录按钮是否可点击
  void checkLoginText() {
    if (_unameExp.hasMatch(_unameController.text) &&
        _pwdExp.hasMatch(_pwdController.text)) {
      this.isBtnEnabled = true;
    } else {
      this.isBtnEnabled = false;
    }
  }

  void loginSub() {
    setState(() {
      this.showLoading = true;
    });
    loginRequest().then((v) => {
          setState(() {
            this.showLoading = false;
          }),
          // 跳转首页
          Navigator.pushNamed(context, 'home')
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 异步操作
  Future loginRequest() async {
    return Future.delayed(Duration(seconds: 2), () {
      print('login success');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childrens = [];
    final _main = Center(
      child: ListView(
        padding: EdgeInsets.only(left: 500.0, right: 30.0, top: 200.0),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Hero(
              tag: 'avatar',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.0,
                child: Image.asset('images/users/user.png'),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  //用户名
                  controller: _unameController,
                  // 以下移动端要求
                  // focusNode: focusNode1, //关联focusNode1
                  // keyboardType: TextInputType.text, //键盘类型
                  // maxLength: 12,
                  // textInputAction: TextInputAction.next, //显示'下一步'
                  decoration: InputDecoration(
                      hintText: '请输入账号',
                      labelText: "账号",
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      prefixIcon: Icon(Icons.perm_identity),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      suffixIcon: _unameController.text.length > 0
                          ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                size: 21,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _unameController.text = '';
                                  checkLoginText();
                                });
                              },
                            )
                          : null),
                  validator: (v) {
                    return !_unameExp.hasMatch(v) ? '账号由6到12位数字与小写字母组成' : null;
                  },
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(focusNode2),
                  onChanged: (v) {
                    setState(() {
                      checkLoginText();
                    });
                  },
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: _pwdController,
                  focusNode: focusNode2,
                  obscureText: isEye, //密码类型 内容用***显示
                  maxLength: 12,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      hintText: '请输入密码',
                      labelText: '密码',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          size: 21,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isEye = !isEye;
                          });
                        },
                      )),
                  validator: (v) {
                    return !_pwdExp.hasMatch(v) ? '密码由6到12位数字与小写字母组成' : null;
                  },
                  onChanged: (v) {
                    setState(() {
                      checkLoginText();
                    });
                  },
                  onEditingComplete: () => loginSub(),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: RaisedButton(
              color: Colors.indigo[700],
              padding: EdgeInsets.symmetric(vertical: 20.0),
              disabledColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0)),
              child: Text('登录',
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
              onPressed: !isBtnEnabled ? null : loginSub,
            ),
          ),
        ],
      ),
    );

    childrens.add(_main);
    if (this.showLoading) {
      childrens.add(Loadding());
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: childrens),
      ),
    );
  }
}
