package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    ModelAndView mv = new ModelAndView();

    @RequestMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request
    ) {
        mv.setViewName("home");
        if (request.getSession().getAttribute("type") == null) {
            mv.setViewName("login");
        }
        return mv;
    }

    @RequestMapping(value = "/login_process")
    public ModelAndView loginProcess(HttpServletRequest request
    ) {
        mv.setViewName("home");
        if (request.getSession().getAttribute("type") == null) {
            mv.addObject("username", request.getParameter("username"));
            mv.addObject("password", request.getParameter("password"));
            mv.setViewName("loginsuccess");
        }
        return mv;
    }

}
