package com.sjdang.manage.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sjdang.util.Constant;

/**
 * @ClassName: com.sjdang.manage.interceptor.LoginCheckInterceptor
 * @Description: TODO(后台管理平台登录拦截器)
 * @author SJDANG
 * @date 2018年2月16日 下午7:53:45
 * @version V1.0
 */
public class LoginCheckInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception e)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView model)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		String url = request.getRequestURI();
		if (url.indexOf("/manage/login") >= 0) {
			return true;
		}
		HttpSession session = request.getSession();
		if (session != null) {
			if (session.getAttribute(Constant.MANAGE_SESSION) != null) {
				return true;
			}
		}
		request.getRequestDispatcher("/WEB-INF/jsp/" + Constant.JSP_MANAGE + "/login/login.jsp").forward(request, response);
		return false;
	}

}
