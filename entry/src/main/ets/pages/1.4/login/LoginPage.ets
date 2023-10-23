import router from '@ohos.router'
import hilog from '@ohos.hilog'

@Extend(TextInput) function inputStyle() {
  .placeholderColor($r('app.color.placeholder_color'))
  .height(45)
  .fontSize(18)
  .width("100%")
  .padding({ left: 16 })
}

@Extend(Text) function blueTextStyle() {
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize(14)
  .fontWeight(FontWeight.Medium)
}

@CustomDialog
export struct LoadingProgressDialog {
  title: string = ''
  controller: CustomDialogController

  build() {
    Column() {
      LoadingProgress()
        .width(40)
        .height(40)
        .color(Color.Gray)
      if (this.title !== '') Text(this.title).fontColor(Color.Gray)
    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
    .constraintSize({ minWidth: 80, minHeight: 80 })
  }
}


@Entry
@Component
export default struct LoginPage {
  account = ''
  password = ''
  @State loadingTitle: string = '登录中'
  loginDialogController = new CustomDialogController({
    builder: LoadingProgressDialog({ title: this.loadingTitle }),
    customStyle: true
  })

  build() {
    Column() {
      Image($r('app.media.logo'))
        .width("78vp")
        .height("78vp")
        .margin({ top: 100 })
      Text("应用名称")
        .fontSize(24)
        .fontWeight(FontWeight.Medium)
        .fontColor(Color.Black)
        .padding({ top: 8 })
      Text($r('app.string.loginDesc'))
        .fontSize(16)
        .fontColor(Color.Gray)
        .padding({ top: 5 })

      TextInput({ placeholder: $r("app.string.account") })
        .type(InputType.Number)
        .inputStyle()
        .margin({ top: 30 })
        .onChange((value) => {
          this.account = value
        })

      TextInput({ placeholder: $r("app.string.password") })
        .type(InputType.Password)
        .inputStyle()
        .margin({ top: 12 })
        .onChange((value) => {
          this.password = value
        })

      Row() {
        Text("使用短信验证码").blueTextStyle()
        Text("忘记密码").blueTextStyle()
      }
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 12 })

      Button() {
        Text("登录").fontColor(Color.White).fontWeight(FontWeight.Medium)
      }
      .width("80%")
      .height(45)
      .margin({ top: 40 })
      .onClick(() => {
        this.login()
      })

      Text("注册账号").blueTextStyle().margin({ top: 12 })

    }
    .backgroundColor($r('app.color.background'))
    .width("100%")
    .height("100%")
    .alignItems(HorizontalAlign.Center)
    .padding({ left: 20, right: 20 })
  }

  private login() {
    // if (this.account === '' || this.password === '') {
    //   promptAction.showToast({ message: '账号或密码不能为空' })
    //   return
    // }

    // this.loginDialogController.open()
    // setTimeout(() => {
    //   this.loginDialogController.close()
    //   router.replaceUrl({ url: "pages/main/MainPage" })
    // }, 2000)

    router.pushUrl({ url: 'pages/1.4/main/MainPage' }).then().catch((err)=>{
      hilog.error(0x00001, "login", err)
    })
  }
}