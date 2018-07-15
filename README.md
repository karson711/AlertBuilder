# AlertBuilder
构建模式ALertController应用
5、构建者模式-开发案例？
		构建UI->构建消息提示框->AlertController构建
		DMAlertController
		分析角色？
		角色一：统一组装类->DMAlertController（可有可无）->需要（方便客户端调用）
		角色二：构建者->Builder（核心）
		角色三：产品->AlertController （核心）
		角色四：参数类
		构建者->精华
		特殊语法：swift框架设计
