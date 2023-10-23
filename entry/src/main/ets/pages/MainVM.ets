import { CourseData } from '../common/model/CourseData'

class MainVM {
  private courseList: CourseData[] = [
    {
      no: 1.4,
      title: "从简单的页面开始",
    },
    {
      no: 1.5,
      title: "构建更加丰富的页面(实际就是一个视频播放器)",
    },
    {
      no: 1.6,
      title: "给应用添加动画",
    },
    {
      no: 1.7,
      title: "从网络获取数据",
    },
    {
      no: 1.8,
      title: "保存应用数据",
    },
    {
      no: 1.9,
      title: "给应用添加通知",
    },
  ]

  getCourseList() {
    return this.courseList
  }
}

export default new MainVM()