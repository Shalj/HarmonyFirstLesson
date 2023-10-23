export class MenuData {
  title: Resource
  icon: Resource
  desc?: Resource
  type?: number

  constructor(title: Resource, icon: Resource, desc?: Resource, type?: number) {
    this.title = title
    this.icon = icon
    this.desc = desc
    this.type = type
  }
}