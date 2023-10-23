import Constants from '@ohos/components/src/main/ets/common/Constants'

@Component
export default struct CourseItem {
  @Prop title: string
  public onItemClick?: () => void

  build() {
    Text(this.title)
      .fontSize(14)
      .fontColor(Color.Black)
      .padding({ left: 16 })
      .width(Constants.MATCH_PARENT)
      .height(40)
      .border({ radius: 0 })
      .onClick(() => {
        this.onItemClick()
      })
  }
}