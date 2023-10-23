export default class BaseResponse {
  /**
   * Code returned by the network request: success, fail.
   */
  code: number;

  /**
   * Message returned by the network request.
   */
  msg: string | Resource;

  /**
   * Data returned by the network request.
   */
  data: string | Object | ArrayBuffer;

  public constructor(code = 0, msg = '', data: string | Object | ArrayBuffer = '') {
    this.code = code;
    this.msg = msg;
    this.data = data;
  }
}