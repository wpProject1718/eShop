package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
    ModelAndView mv = new ModelAndView();
    
    @RequestMapping(value = "/admin")
    public ModelAndView adminPage(HttpServletRequest request) {
        request.getSession().getAttribute("usertype");
        mv.setViewName("admin_page");
        
        return mv;
    }

    @RequestMapping(value = "/admin_modify")
    public ModelAndView modify(HttpServletRequest request) {
        request.getSession().getAttribute("usertype");
        mv.setViewName("admin_modify");

        return mv;
    }

    @RequestMapping(value = "/admin_category")
    public ModelAndView modifyCategory(HttpServletRequest request) {
        request.getSession().getAttribute("usertype");
        mv.setViewName("create_category");

        return mv;
    }

    @RequestMapping(value = "/admin_product")
    public ModelAndView modifyProduct(HttpServletRequest request) {
        request.getSession().getAttribute("usertype");
        mv.setViewName("create_product");

        return mv;
    }
}
