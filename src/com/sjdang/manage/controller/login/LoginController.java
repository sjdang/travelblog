package com.sjdang.manage.controller.login;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sjdang.manage.dao.login.ManageUserDao;
import com.sjdang.manage.entity.login.LoginHistoryEntity;
import com.sjdang.manage.entity.login.ManageUserEntity;
import com.sjdang.util.Constant;
import com.sjdang.util.UtilMd5;
import com.sjdang.util.UtilPrintWriter;

import javolution.util.FastMap;

/**
 * @ClassName: com.sjdang.manage.controller.login.LoginController
 * @Description: TODO(��̨�������̨��¼���Controller)
 * @author SJDANG
 * @date 2018��2��16�� ����8:04:49
 * @version V1.0
 */
@Controller
@RequestMapping("/manage/login")
public class LoginController {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ManageUserDao manageUserDao;
	
	@RequestMapping("/index.do")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView(Constant.JSP_MANAGE + "/login/login");
		return model;
	}
	
	/**
	 * @Description: TODO(ע����¼)
	 * @author SJDANG
	 * @date 2018��2��20�� ����5:20:21
	 * @param request
	 * @param response
	 * @return ModelAndView
	 */
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView(Constant.JSP_MANAGE + "/login/logout");
		HttpSession session = request.getSession();
		if (session.getAttribute(Constant.MANAGE_SESSION) == null) {
			return new ModelAndView(Constant.JSP_MANAGE + "/login/login");
		}
		ManageUserEntity user = (ManageUserEntity) session.getAttribute(Constant.MANAGE_SESSION);
		model.addObject("user" ,user);
		session.invalidate();
		manageUserDao.updateLogoutTime(session.getId());
		return model;
	}
	
	/**
	 * @Description: TODO(��¼��֤)
	 * @author SJDANG
	 * @date 2018��2��18�� ����12:15:41
	 * @param request
	 * @param response
	 * @return void
	 */
	@ResponseBody
	@RequestMapping(value="/login.do")
	public void login(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="userNo", required=true) String userNo,
			@RequestParam(value="password", required=true) String passWord) {
		Map<String, Object> resultMap = FastMap.newInstance();
		resultMap.put("returnCode", Constant.FAILURE);
		try {
			ManageUserEntity user = manageUserDao.findOne(userNo);
			if (user == null) {
				resultMap.put("returnClass", "userNo");
				resultMap.put("returnMsg", "��ǰ�û������ڣ�����������");
				UtilPrintWriter.printJsonData(resultMap, response);
				return;
			}
			int isValid = user.getIsValid();
			if (isValid == 0) {
				resultMap.put("returnClass", "userNo");
				resultMap.put("returnMsg", "��ǰ�û���ʧЧ������ϵ����Ա");
				UtilPrintWriter.printJsonData(resultMap, response);
				return;
			}
			String password = user.getPassword();
			if (!password.equals(UtilMd5.encoderByMD5(passWord))) {
				resultMap.put("returnClass", "password");
				resultMap.put("returnMsg", "�������������������������");
				UtilPrintWriter.printJsonData(resultMap, response);
				return;
			}
			HttpSession session = request.getSession();
			session.setAttribute(Constant.MANAGE_SESSION, user);
			
			LoginHistoryEntity history = new LoginHistoryEntity();
			history.setSessionId(session.getId());
			history.setUserId(user.getUserId());
			history.setUserType(Constant.USER_TYPE_MANAGE);
			history.setLoginTime(new Date());
			manageUserDao.createLoginHistory(history);
			
			resultMap.put("returnCode", Constant.SUCCESS);
		} catch (Exception e) {
			resultMap.put("returnMsg", "ϵͳ�쳣�����Ժ����µ�¼");
			logger.error("��¼�쳣��", e);
		}
		UtilPrintWriter.printJsonData(resultMap, response);
	}
	
	/** 
	* @Description: TODO(�л�ҳ��ǰ��鵱ǰ�û�Session�Ƿ����) 
	* @param request
	* @param response
	* @return void
	* @date 2021��7��15�� ����11:14:05  
	*/
	@ResponseBody
	@RequestMapping(value="/checkSessionStatus.do")
	public void checkSessionStatus(HttpServletRequest request, HttpServletResponse response) {
		int status = 0;
		HttpSession session = request.getSession();
		if (session.getAttribute(Constant.MANAGE_SESSION) == null) {
			status = 1;
		}
		UtilPrintWriter.printJsonData(response, Constant.SUCCESS, Constant.SUCCESS_MSG, status);
	}

}
