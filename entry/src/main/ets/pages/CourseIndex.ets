import router from '@ohos.router'
import LoginPage from './1.4/login/LoginPage'
import { VideoPlayPage } from './1.5/VideoPlayPage'

@Entry
@Component
export default struct CourseIndex {
  @State no: number = 0
  @State title: string = ""

  @Builder content() {
    if (this.no == 1.4) {
      LoginPage()
    } else if (this.no == 1.5) {
      VideoPlayPage()
    } else {
      Text('还没写呢')
    }
  }

  onPageShow() {
    this.no = router.getParams()['no']
    this.title = router.getParams()["title"]
  }

  build() {
    Stack() {
      this.content()
    }
  }
}