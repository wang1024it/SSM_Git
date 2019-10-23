// const loginInfo = {
// 	code: -1,
// 	message: '密码错误'
// }

//使用mockjs的模板生成随机数据
const loginInfo = {
	'code|0-1': 0,
	'msg|3-10': 'msg'
}
export default loginInfo;
