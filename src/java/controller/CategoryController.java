package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryController {

    ModelAndView mv = new ModelAndView();

    @RequestMapping(value = "/addcat", method = RequestMethod.POST)
    public ModelAndView addCat(HttpServletRequest request) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 3) {
                mv.addObject("name", request.getParameter("name"));
                mv.setViewName("createcatsuccess");
            }
        }
        return mv;
    }

    @RequestMapping(value = "/editcat")
    public ModelAndView editCart(HttpServletRequest request) {
        mv.setViewName("login");
        if (request.getSession().getAttribute("type") != null) {
            int type = (int) request.getSession().getAttribute("type");
            if (type == 3) {
                mv.addObject("id", request.getParameter("id"));
                mv.addObject("name", request.getParameter("name"));
                mv.setViewName("editcatsuccess");
            }
        }
        return mv;
    }
}
