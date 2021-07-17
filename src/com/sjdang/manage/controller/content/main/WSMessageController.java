package com.sjdang.manage.controller.content.main;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sjdang.manage.dao.login.ManageUserDao;

/**
 * @ClassName: com.sjdang.manage.controller.content.main.WSMessageController
 * @Description: TODO(管理控制台WebSocket消息推送)
 * @author SJDANG
 * @date 2018年2月22日 下午9:11:41
 * @version V1.0
 */
@Controller
@ServerEndpoint("/manage/main/websocket")
public class WSMessageController {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	//private CompanyService companyService = (CompanyService) ContextLoader.getCurrentWebApplicationContext().getBean("companyService");
	
	@Autowired
	private ManageUserDao manageUserDao;
	
	@OnMessage
    public void onMessage(String message, Session session) throws IOException, InterruptedException {
		logger.info("WebSocket:received message successfully," + message);
		try {
			int preCount = -1;
			int sentMessages = 0;
			while(sentMessages < 20){
				/*
				int count = manageUserDao.getUserCount();
				if (count > preCount) {
					session.getBasicRemote().sendText(count + "");
					sentMessages++;
					preCount = count;
				}
				*/
				sentMessages ++;
				session.getBasicRemote().sendText(sentMessages + "");
				logger.debug("WebSocket requested successfully : " + sentMessages);
				Thread.sleep(5000);
			}
		} catch (Exception e) {
			logger.error("WebSocket:some error happened,", e);
		}
    }
	
	@OnOpen
    public void onOpen () {
        logger.info("WebSocket:Client connected");
    }

    @OnClose
    public void onClose () {
    	logger.info("WebSocket:Client closed");
    }

}
