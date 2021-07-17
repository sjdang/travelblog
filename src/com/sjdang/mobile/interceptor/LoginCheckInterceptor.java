package com.sjdang.mobile.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ClassName: com.sjdang.mobile.interceptor.LoginCheckInterceptor
 * @Description: TODO(手机端登录拦截器)
 * @author SJDANG
 * @date 2018年2月16日 下午7:46:00
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
		if (url.indexOf("/mobile/login") >= 0) {
			return true;
		}
		return true;
	}

}
