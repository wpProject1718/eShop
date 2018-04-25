package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    ModelAndView mv = new ModelAndView();

    @RequestMapping(value = "/admin_create")
    public ModelAndView modify(HttpServletRequest request
    ) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 3) {
                mv.setViewName("create_category");
            }
        }
        return mv;
    }

    @RequestMapping(value = "/admin_category")
    public ModelAndView modifyCategory(HttpServletRequest request
    ) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 3) {
                mv.setViewName("edit_category");
            }
        }
        return mv;
    }
}
