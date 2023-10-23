import router from '@ohos.router';
import Constants from '../common/Constants';

@Component
export struct Toolbar {
  @BuilderParam leading: () => void = null
  @Prop title: string
  @BuilderParam actions: () => void = null

  @Builder _leading() {
      /*this.leading || */Image($r("app.media.ic_public_back"))
        .padding(3)
        .width(24)
        .height(24)
        .onClick(e => router.back())
  }

  build() {
    Row() {
      this._leading()
      Text(this.title)
        .width(Constants.MATCH_PARENT)
        .align(Alignment.Center)
        .alignSelf(ItemAlign.Center)
        .layoutWeight(1)
        .margin({ left: 10, right: 10 })
      if (this.actions != null) {
        this.actions()
      }
    }
    .width(Constants.MATCH_PARENT)
    .height(Constants.TOOLBAR_HEIGHT)
    .alignItems(VerticalAlign.Center)
    .padding({ left: 16, right: 16 })
  }
}

