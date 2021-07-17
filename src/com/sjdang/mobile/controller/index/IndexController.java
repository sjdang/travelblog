package com.sjdang.mobile.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sjdang.util.Constant;

/**
 * @ClassName: com.sjdang.mobile.controller.index.IndexController
 * @Description: TODO()
 * @author SJDANG
 * @date 2018年2月25日 下午2:14:38
 * @version V1.0
 */
@Controller
@RequestMapping("/mobile/index")
public class IndexController {
	
	@RequestMapping("/index.do")
	public ModelAndView index(){
		ModelAndView model = new ModelAndView(Constant.JSP_MOBILE + "/index/index");
		return model;
	}

}
