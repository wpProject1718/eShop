package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegisterController {

    ModelAndView mv = new ModelAndView();

    @RequestMapping(value = "/register")
    public ModelAndView register(HttpServletRequest request
    ) {
        mv.setViewName("home");
        if (request.getSession().getAttribute("type") == null) {
            mv.setViewName("register");
        }
        return mv;
    }

    @RequestMapping(value = "/register_process")
    public ModelAndView registerProcess(HttpServletRequest request
    ) {
        mv.setViewName("home");
        if (request.getSession().getAttribute("type") == null) {
            mv.addObject("username", request.getParameter("username"));
            mv.addObject("password", request.getParameter("password"));
            mv.setViewName("registersuccess");
        }
        return mv;
    }

}
